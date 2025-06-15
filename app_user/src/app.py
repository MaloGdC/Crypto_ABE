import tkinter as tk
from tkinter import ttk, messagebox
from encrypt_message import encrypt_hybrid as cm
from decrypt_message import decrypt_message as dm
import os

# ===== Fonctions utilitaires =====
def rafraichir_utilisateurs():
    utilisateurs = ["no user"] + get_user_files()
    user_combobox['values'] = utilisateurs
    if user_var.get() not in utilisateurs:
        user_var.set("no user")


def get_user_files():
    path = "../users-keys"
    try:
        files = os.listdir(path)
        return [f[:-3] for f in files if os.path.isfile(os.path.join(path, f))]
    except FileNotFoundError:
        return []

def get_message_files():
    path = "../messages"
    try:
        return [f for f in os.listdir(path) if os.path.isfile(os.path.join(path, f))]
    except FileNotFoundError:
        return []

# ===== Fenêtre principale =====
root = tk.Tk()
root.title("Visualiseur de messages")
root.geometry("800x600")
root.configure(bg="#f7f9fc")
root.option_add("*Font", "Arial 10")

# ===== HAUT DE PAGE =====
top_frame = tk.Frame(root, bg="#f7f9fc")
top_frame.pack(side=tk.TOP, fill=tk.X, padx=20, pady=15)

user_label = tk.Label(top_frame, text="Utilisateur :", font=('Arial', 10), bg="#f7f9fc")
user_label.pack(side=tk.LEFT, padx=(0, 10))

user_var = tk.StringVar(value="no user")
user_combobox = ttk.Combobox(top_frame, textvariable=user_var, values=["no user"] + get_user_files(), state="readonly", width=30)
user_combobox.pack(side=tk.LEFT)

encrypt_button = tk.Button(top_frame, text="➕ Chiffrer un message", font=('Arial', 10), bg="#3498db", fg="white", relief="flat", padx=10, pady=5, command=lambda: ouvrir_formulaire())
encrypt_button.pack(side=tk.RIGHT)

# ===== ZONE CENTRALE =====
center_frame = tk.Frame(root, bg="#f7f9fc")
center_frame.pack(expand=True, fill=tk.BOTH, padx=20, pady=10)

def afficher_fichiers():
    for widget in center_frame.winfo_children():
        widget.destroy()

    message_files = get_message_files()
    if not message_files:
        tk.Label(center_frame, text="Aucun message disponible.", bg="#f7f9fc", fg="#7f8c8d", font=("Arial", 12)).pack(pady=20)
        return

    columns = 4
    for index, filename in enumerate(message_files):
        row = index // columns
        col = index % columns

        file_path = os.path.abspath(os.path.join("../messages", filename))
        icon_frame = tk.Frame(center_frame, padx=20, pady=20, bd=1, relief=tk.RIDGE, bg="white")
        icon_frame.grid(row=row, column=col, padx=10, pady=10)

        def afficher_chemin(file=file_path):
            if user_var.get() == "no user":
                messagebox.showwarning("Aucun utilisateur", "Veuillez sélectionner un utilisateur pour déchiffrer ce message.")
                return
            user_key_path = f"../users-keys/{user_var.get()}.sk"
            message = dm(file, "../keys/public_key.pk", user_key_path)
            if message is not None:
                messagebox.showinfo("Message déchiffré", message)
            else:
                messagebox.showerror("Erreur", "Le message n'a pas pu être déchiffré.")

        icon_label = tk.Label(icon_frame, text="📄", font=("Arial", 24), bg="white", cursor="hand2")
        icon_label.pack()
        icon_label.bind("<Button-1>", lambda e, f=file_path: afficher_chemin(f))

        short_name = filename[:-4] if len(filename) > 4 else filename
        name_label = tk.Label(icon_frame, text=short_name, wraplength=100, bg="white")
        name_label.pack()

# ===== FORMULAIRE DE CHIFFREMENT =====
def ouvrir_formulaire():
    if user_var.get() == "no user":
        messagebox.showwarning("Utilisateur requis", "Veuillez sélectionner un utilisateur avant de chiffrer un message.")
        return

    for widget in center_frame.winfo_children():
        widget.destroy()

    tk.Label(center_frame, text="Nom du fichier à chiffrer :", bg="#f7f9fc").pack(anchor="w", padx=10, pady=(10, 0))
    nom_entry = tk.Entry(center_frame, width=40)
    nom_entry.pack(padx=10, pady=5)

    tk.Label(center_frame, text="Message à chiffrer :", bg="#f7f9fc").pack(anchor="w", padx=10, pady=(10, 0))
    msg_frame = tk.Frame(center_frame, bg="#f7f9fc")
    msg_frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=5)

    msg_entry = tk.Text(msg_frame, width=60, height=8, wrap="word", font=("Arial", 10))
    msg_entry.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

    scrollbar = tk.Scrollbar(msg_frame, command=msg_entry.yview)
    scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
    msg_entry.config(yscrollcommand=scrollbar.set)


    tk.Label(center_frame, text="Politique CP-ABE (ex: (A and B) or (C and D)) :", bg="#f7f9fc").pack(anchor="w", padx=10, pady=(10, 0))
    policy_entry = tk.Entry(center_frame, width=60)
    policy_entry.pack(padx=10, pady=5)

    def annuler():
        afficher_fichiers()

    def valider():
        nom = nom_entry.get().strip()
        msg = msg_entry.get("1.0", tk.END).strip()
        policy = policy_entry.get().strip()
        if not nom:
            messagebox.showerror("Erreur", "Le nom de fichier est vide.")
            return
        cm(msg, policy, "../keys/public_key.pk", f"../messages/{nom}.abe")
        messagebox.showinfo("Succès", f"Fichier '{nom}' chiffré avec la politique : {policy}")
        afficher_fichiers()

    button_frame = tk.Frame(center_frame, bg="#f7f9fc")
    button_frame.pack(pady=15)

    tk.Button(button_frame, text="✔ Valider", bg="#27ae60", fg="white", relief="flat", padx=12, pady=6, command=valider).pack(side=tk.LEFT, padx=10)
    tk.Button(button_frame, text="Annuler", bg="#bdc3c7", fg="black", relief="flat", padx=12, pady=6, command=annuler).pack(side=tk.LEFT, padx=10)

# ===== BAS DE PAGE =====
bottom_frame = tk.Frame(root, bg="#f7f9fc")
bottom_frame.pack(side=tk.BOTTOM, fill=tk.X, padx=20, pady=10)

refresh_button = tk.Button(
    bottom_frame, 
    text="🔄 Rafraîchir utilisateurs", 
    bg="#95a5a6", 
    fg="white", 
    relief="flat", 
    padx=12, 
    pady=6, 
    command=rafraichir_utilisateurs
)
refresh_button.pack(side=tk.RIGHT)

# ===== Initialisation =====
afficher_fichiers()
root.mainloop()
