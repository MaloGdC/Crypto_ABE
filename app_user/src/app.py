import tkinter as tk
from tkinter import ttk, messagebox
from crypt_message import encrypt_hybrid as cm
from decrypt_message import decrypt_message as dm
import os

# ===== Fonctions utilitaires =====
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

# ===== HAUT DE PAGE =====
top_frame = tk.Frame(root)
top_frame.pack(side=tk.TOP, fill=tk.X, padx=10, pady=10)

user_var = tk.StringVar(value="no user")
user_combobox = ttk.Combobox(top_frame, textvariable=user_var, values=["no user"] + get_user_files(), state="readonly")
user_combobox.pack(side=tk.RIGHT)

user_label = tk.Label(top_frame, text="Utilisateur :", font=('Arial', 10))
user_label.pack(side=tk.RIGHT, padx=(10, 5))

# ===== ZONE CENTRALE =====
center_frame = tk.Frame(root)
center_frame.pack(expand=True, fill=tk.BOTH, padx=20, pady=20)

def afficher_fichiers():
    for widget in center_frame.winfo_children():
        widget.destroy()

    message_files = get_message_files()
    columns = 4

    for index, filename in enumerate(message_files):
        row = index // columns
        col = index % columns

        file_path = os.path.abspath(os.path.join("../messages", filename))

        # Déterminer si un seul fichier est affiché
        single_file = len(message_files) == 1

        icon_frame = tk.Frame(
            center_frame,
            padx=40 if single_file else 20,
            pady=40 if single_file else 20,
            bd=1,
            relief=tk.RIDGE
        )

        icon_frame.grid(row=row, column=col, sticky="nw")

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



        icon_label = tk.Label(icon_frame, text="📄", font=("Arial", 24), width=2, height=1, cursor="hand2")
        icon_label.pack()
        icon_label.bind("<Button-1>", lambda e, f=file_path: afficher_chemin(f))

        short_name = filename[:-4] if len(filename) > 4 else filename
        name_label = tk.Label(icon_frame, text=short_name, wraplength=100)
        name_label.pack()

afficher_fichiers()

# ===== FORMULAIRE DE CHIFFREMENT =====
def ouvrir_formulaire():
    if user_var.get() == "no user":
        messagebox.showwarning("Utilisateur requis", "Veuillez sélectionner un utilisateur avant de chiffrer un message.")
        return

    for widget in center_frame.winfo_children():
        widget.destroy()

    # Champ nom fichier
    tk.Label(center_frame, text="Nom du fichier à chiffrer :").pack(anchor="w", padx=10, pady=(10, 0))
    nom_entry = tk.Entry(center_frame, width=40)
    nom_entry.pack(padx=10, pady=5)
    
    # Champ message
    tk.Label(center_frame, text="Message à chiffrer :").pack(anchor="w", padx=10, pady=(10, 0))
    msg_entry = tk.Entry(center_frame, width=40)
    msg_entry.pack(padx=10, pady=5)

    # Champ politique
    tk.Label(center_frame, text="Politique CP-ABE (ex: (A and B) or (C and D)) :").pack(anchor="w", padx=10, pady=(10, 0))
    policy_entry = tk.Entry(center_frame, width=60)
    policy_entry.pack(padx=10, pady=5)

    def annuler():
        afficher_fichiers()

    def valider():
        nom = nom_entry.get().strip()
        msg = msg_entry.get().strip()
        policy = policy_entry.get().strip()
        if not nom:
            messagebox.showerror("Erreur", "Le nom de fichier est vide.")
            return

        # ✅ Impression dans la console
        print(f"Nom du fichier : {nom}")
        print(f"Politique : {policy}")
        print(f"Utilisateur : {user_var.get()}")
        cm(msg, policy, "../keys/public_key.pk", "../messages/"+nom+".abe")

        messagebox.showinfo("Succès", f"Fichier '{nom}' chiffré avec la politique : {policy}")
        afficher_fichiers()

    button_frame = tk.Frame(center_frame)
    button_frame.pack(pady=10)

    tk.Button(button_frame, text="Valider", command=valider).pack(side=tk.LEFT, padx=10)
    tk.Button(button_frame, text="Annuler", command=annuler).pack(side=tk.LEFT, padx=10)
    
# ===== BAS DE PAGE =====
bottom_frame = tk.Frame(root)
bottom_frame.pack(side=tk.BOTTOM, fill=tk.X, pady=10)

encrypt_button = tk.Button(bottom_frame, text="Chiffrer un message", font=('Arial', 12), command=ouvrir_formulaire)
encrypt_button.pack(pady=10)

# ===== Lancer l'appli =====
root.mainloop()
