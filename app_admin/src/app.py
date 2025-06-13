import tkinter as tk
from tkinter import messagebox

# Fonction déclenchée par le bouton
def dire_bonjour():
    nom = entree_nom.get()
    if nom:
        messagebox.showinfo("Bonjour", f"Bonjour, {nom} !")
    else:
        messagebox.showwarning("Attention", "Veuillez entrer votre nom.")

# Créer la fenêtre principale
fenetre = tk.Tk()
fenetre.title("Ma première page Tkinter")
fenetre.geometry("300x150")  # Taille de la fenêtre

# Ajouter un label
label_nom = tk.Label(fenetre, text="Entrez votre nom :")
label_nom.pack(pady=5)

# Ajouter une zone de saisie
entree_nom = tk.Entry(fenetre)
entree_nom.pack(pady=5)

# Ajouter un bouton
bouton_saluer = tk.Button(fenetre, text="Dire bonjour", command=dire_bonjour)
bouton_saluer.pack(pady=10)

# Lancer la boucle principale
fenetre.mainloop()
