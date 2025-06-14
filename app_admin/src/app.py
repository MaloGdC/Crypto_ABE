import tkinter as tk
from tkinter import ttk
import os
from generate_key import generate_decryption_key as gk
from generate_master_key import keygen as gmk

# ===== FONCTIONS =====
def get_user_files():
    path = "../users-keys"
    try:
        files = [f for f in os.listdir(path) if os.path.isfile(os.path.join(path, f))]
        return [f[:-3] if len(f) > 3 else f for f in files]
    except FileNotFoundError:
        return []

def ajouter_utilisateur():
    if not form_canvas.winfo_ismapped():
        form_canvas.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

def actualiser_tableau():
    for row in tree.get_children():
        tree.delete(row)
    for f in get_user_files():
        tree.insert("", tk.END, values=(f,))

def valider_formulaire():
    name = nom_entry.get().strip()
    attributes = [e.get().strip().upper() for e in attributs_entries if e.get().strip()]
    if not name:
        tk.messagebox.showwarning("Erreur", "Veuillez entrer un nom d'utilisateur.")
        return
    if not attributes:
        tk.messagebox.showwarning("Erreur", "Veuillez ajouter au moins un attribut.")
        return

    gk(attributes, "public_key.pk", "master_key.msk", name + ".sk")
    actualiser_tableau()
    nom_entry.delete(0, tk.END)
    for e in attributs_entries:
        e.destroy()
    attributs_entries.clear()
    ajouter_champ_attribut()
    form_canvas.pack_forget()

def ajouter_champ_attribut():
    if attributs_entries and attributs_entries[-1].get().strip() == "":
        return
    entry = tk.Entry(attr_container, width=18)
    attributs_entries.append(entry)
    index = len(attributs_entries) - 1
    row, col = divmod(index, 4)
    entry.grid(row=row, column=col, padx=5, pady=5, sticky="w")

# ===== CLÉ MAÎTRE INITIALE =====
if not os.listdir("../keys"):
    gmk()

# ===== FENÊTRE PRINCIPALE =====
root = tk.Tk()
root.title("Gestion des utilisateurs CP-ABE")
root.geometry("780x550")
root.configure(bg="#f7f9fc")
root.option_add("*Font", "Arial 10")

# ===== HAUT DE PAGE =====
top_frame = tk.Frame(root, bg="#f7f9fc")
top_frame.pack(side=tk.TOP, fill=tk.X, padx=20, pady=15)

label_utilisateurs = tk.Label(top_frame, text="Utilisateurs existants", font=('Arial', 14, 'bold'), bg="#f7f9fc", fg="#2c3e50")
label_utilisateurs.pack(anchor="w")

table_button_frame = tk.Frame(top_frame, bg="#f7f9fc")
table_button_frame.pack(fill=tk.X, pady=(10, 0))

tree_frame = tk.Frame(table_button_frame)
tree_frame.pack(side=tk.LEFT, fill=tk.X, expand=True)

scrollbar_y = tk.Scrollbar(tree_frame, orient="vertical")
scrollbar_y.pack(side=tk.RIGHT, fill=tk.Y)

tree = ttk.Treeview(tree_frame, columns=("filename",), show="headings", yscrollcommand=scrollbar_y.set, height=5)
tree.heading("filename", text="Fichiers utilisateurs")
tree.column("filename", width=500, anchor="center")
tree.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

scrollbar_y.config(command=tree.yview)

for f in get_user_files():
    tree.insert("", tk.END, values=(f,))

ajouter_button = tk.Button(table_button_frame, text="➕ Ajouter un utilisateur", command=ajouter_utilisateur, bg="#3498db", fg="white", relief="flat", padx=10, pady=5)
ajouter_button.pack(side=tk.RIGHT, padx=10)

# ===== FORMULAIRE =====
form_canvas = tk.Canvas(root, height=270, bg="#f7f9fc", highlightthickness=0)
form_canvas.pack_forget()

form_scrollbar = tk.Scrollbar(root, orient="vertical", command=form_canvas.yview)
form_canvas.configure(yscrollcommand=form_scrollbar.set)
form_scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

form_frame_container = tk.Frame(form_canvas, bg="#ffffff", bd=2, relief=tk.RIDGE)
form_canvas.create_window((0, 0), window=form_frame_container, anchor="nw", width=740)

def on_configure(event):
    form_canvas.configure(scrollregion=form_canvas.bbox("all"))

form_frame_container.bind("<Configure>", on_configure)

# Champs du formulaire
tk.Label(form_frame_container, text="Nom de l'utilisateur :", bg="#ffffff").pack(anchor='w', padx=10, pady=(10, 0))
nom_entry = tk.Entry(form_frame_container, width=30)
nom_entry.pack(padx=10, pady=5, anchor='w')

tk.Label(form_frame_container, text="Attributs :", bg="#ffffff").pack(anchor='w', padx=10, pady=(10, 0))

attr_container = tk.Frame(form_frame_container, bg="#ffffff", width=720, height=100)
attr_container.pack(padx=10, pady=5, anchor='w')
attr_container.pack_propagate(False)

attributs_entries = []
ajouter_champ_attribut()

ajout_attr_button = tk.Button(form_frame_container, text="➕ Ajouter un attribut", command=ajouter_champ_attribut, bg="#2ecc71", fg="white", relief="flat", padx=8)
ajout_attr_button.pack(anchor='w', padx=10, pady=5)

valider_button = tk.Button(form_frame_container, text="✔ Valider", command=valider_formulaire, bg="#27ae60", fg="white", relief="flat", padx=12, pady=6)
valider_button.pack(anchor='e', padx=10, pady=15)

# ===== BOUCLE PRINCIPALE =====
root.mainloop()
