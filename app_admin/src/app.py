import tkinter as tk
from tkinter import ttk
import os
from generate_key import generate_decryption_key as gk
from generate_master_key import keygen as gmk

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
    # Vider le tableau
    for row in tree.get_children():
        tree.delete(row)
    
    # Recharger les fichiers (en enlevant l'extension si besoin)
    for f in get_user_files():
        tree.insert("", tk.END, values=(f,))


def valider_formulaire():
    name = nom_entry.get()
    attributes = [e.get().strip().upper() for e in attributs_entries if e.get().strip()]
    print("Nouvel utilisateur :", name)
    print("Attributs :", attributes)

    # Appel de la génération de clé
    gk(attributes, "public_key.pk", "master_key.msk", name + ".sk")

    # Mettre à jour le tableau
    actualiser_tableau()

    # Réinitialiser le formulaire
    nom_entry.delete(0, tk.END)

    for e in attributs_entries:
        e.destroy()
    attributs_entries.clear()

    ajouter_champ_attribut()  # Ajoute un seul champ vide par défaut

    # Cacher le formulaire
    form_canvas.pack_forget()


if not os.listdir("../keys"):  
    gmk()

# Fenêtre principale
root = tk.Tk()
root.title("Page admin")
root.geometry("750x500")

# ==================== HAUT DE PAGE ====================
top_frame = tk.Frame(root)
top_frame.pack(side=tk.TOP, fill=tk.X, padx=10, pady=10)

# Titre
label_utilisateurs = tk.Label(top_frame, text="Utilisateurs existants", font=('Arial', 12, 'bold'))
label_utilisateurs.pack(anchor="w")

# Cadre tableau + bouton côte à côte
table_button_frame = tk.Frame(top_frame)
table_button_frame.pack(fill=tk.X)

# Cadre tableau avec scrollbar interne
tree_frame = tk.Frame(table_button_frame)
tree_frame.pack(side=tk.LEFT, fill=tk.X, expand=True)

scrollbar_y = tk.Scrollbar(tree_frame, orient="vertical")
scrollbar_y.pack(side=tk.RIGHT, fill=tk.Y)

tree = ttk.Treeview(tree_frame, columns=("filename",), show="headings", yscrollcommand=scrollbar_y.set, height=5)
tree.heading("filename", text="Fichiers utilisateurs")
tree.column("filename", width=400)
tree.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

scrollbar_y.config(command=tree.yview)

# Remplir le tableau
for f in get_user_files():
    tree.insert("", tk.END, values=(f,))

# Bouton à droite du tableau
ajouter_button = tk.Button(table_button_frame, text="Ajouter un utilisateur", command=ajouter_utilisateur)
ajouter_button.pack(side=tk.RIGHT, padx=10, anchor="n")

# ==================== FORMULAIRE ====================
form_canvas = tk.Canvas(root, height=250)
form_canvas.pack_forget()

form_scrollbar = tk.Scrollbar(root, orient="vertical", command=form_canvas.yview)
form_canvas.configure(yscrollcommand=form_scrollbar.set)

form_scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

form_frame_container = tk.Frame(form_canvas, bd=2, relief=tk.GROOVE, bg="#f0f0f0", width=750)
form_canvas.create_window((0, 0), window=form_frame_container, anchor="nw", width=700)

def on_configure(event):
    form_canvas.configure(scrollregion=form_canvas.bbox("all"))

form_frame_container.bind("<Configure>", on_configure)

# Champ nom
tk.Label(form_frame_container, text="Nom de l'utilisateur :", bg="#f0f0f0").pack(anchor='w', padx=10, pady=(10, 0))
nom_entry = tk.Entry(form_frame_container, width=30)
nom_entry.pack(padx=10, pady=5, anchor='w')

# Label attributs
tk.Label(form_frame_container, text="Attributs :", bg="#f0f0f0").pack(anchor='w', padx=10, pady=(10, 0))

# Grille d'attributs avec taille fixe
attr_container = tk.Frame(form_frame_container, bg="#f0f0f0", width=720, height=100)
attr_container.pack(padx=10, pady=5, anchor='w')
attr_container.pack_propagate(False)  # empêche l'expansion dynamique

attributs_entries = []

def ajouter_champ_attribut():
    # Si un champ existe déjà, vérifier qu'il est rempli
    if attributs_entries:
        dernier = attributs_entries[-1]
        if dernier.get().strip() == "":
            return  # Ne rien faire si le champ précédent est vide

    # Créer et placer le nouveau champ
    entry = tk.Entry(attr_container, width=18)
    attributs_entries.append(entry)

    index = len(attributs_entries) - 1
    row = index // 4
    col = index % 4
    entry.grid(row=row, column=col, padx=5, pady=5, sticky="w")


ajouter_champ_attribut()  # Premier champ

# Ajouter un attribut
ajout_attr_button = tk.Button(form_frame_container, text="Ajouter un attribut", command=ajouter_champ_attribut)
ajout_attr_button.pack(anchor='w', padx=10, pady=5)

# Bouton valider
valider_button = tk.Button(form_frame_container, text="Valider", command=valider_formulaire)
valider_button.pack(anchor='e', padx=10, pady=10)

# Boucle principale
root.mainloop()