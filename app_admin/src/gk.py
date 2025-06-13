from charm.toolbox.pairinggroup import PairingGroup
from charm.schemes.abenc.abenc_bsw07 import CPabe_BSW07
from charm.core.engine.util import objectToBytes, bytesToObject
import os

def generate_decryption_key(attributes: list, pk_file: str, msk_file: str, sk_output_file: str):
    """
    Génère une clé de déchiffrement CP-ABE avec les attributs donnés.

    :param attributes: Liste de chaînes représentant les attributs de l'utilisateur.
    :param pk_file: Chemin du fichier contenant la clé publique.
    :param msk_file: Chemin du fichier contenant la clé maître secrète.
    :param sk_output_file: Chemin où sauvegarder la clé secrète générée.
    """
    
    base_path = os.path.dirname(os.path.abspath(__file__))  
    key_folder = os.path.join(base_path, "../keys/")
    user_folder = os.path.join(base_path, "../users-keys/")
    output_path = os.path.join(user_folder, sk_output_file)
    msk_path = os.path.join(key_folder, msk_file)
    pk_path = os.path.join(key_folder, pk_file)

    # Vérifier et créer le dossier du fichier de sortie
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    # Initialisation du groupe cryptographique
    group = PairingGroup('MNT224')  

    # Initialisation du schéma CP-ABE
    cpabe = CPabe_BSW07(group)

    try:
        # Chargement des clés publique (PK) et maître secrète (MSK)
        with open(pk_path, 'rb') as f:
            pk = bytesToObject(f.read(), group)
        with open(msk_path, 'rb') as f:
            msk = bytesToObject(f.read(), group)
    except Exception as e:
        print(f"❌ Erreur lors du chargement des clés : {e}")
        return

    # Génération de la clé secrète (SK) avec les attributs
    sk = cpabe.keygen(pk, msk, attributes)

    # Sérialisation et sauvegarde de la clé secrète
    with open(output_path, 'wb') as f:
        f.write(objectToBytes(sk, group))

    print(f"Cle de dechiffrement generee et sauvegardee dans {output_path}")

if __name__=="__main__":
    alice_attributes = ["Etudiant", "UQAC", "CRYPTO"]
    bob_attributes = ["Etudiant", "UQAC", "FORENSIQUE"]
    
    generate_decryption_key(alice_attributes, "public_key.pk", "master_key.msk", "alice.sk")
    generate_decryption_key(bob_attributes, "public_key.pk", "master_key.msk", "bob.sk")
