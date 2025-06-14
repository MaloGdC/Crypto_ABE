import os
from charm.toolbox.pairinggroup import PairingGroup
from charm.schemes.abenc.abenc_bsw07 import CPabe_BSW07
from charm.core.engine.util import objectToBytes, bytesToObject

def keygen():
    # Initialisation du groupe de bilinéarité
    group = PairingGroup('MNT224')

    # Initialisation du schéma CP-ABE
    cpabe = CPabe_BSW07(group)

    # Génération des clés
    (public_key, master_secret_key) = cpabe.setup()

    # Création du dossier de stockage
    keys_dir = os.path.abspath("../keys")
    os.makedirs(keys_dir, exist_ok=True)

    # Sérialisation des clés et stockage sous forme binaire
    with open(os.path.join(keys_dir, "master_key.msk"), "wb") as msk_file:
        msk_file.write(objectToBytes(master_secret_key, group))

    with open(os.path.join(keys_dir, "public_key.pk"), "wb") as pk_file:
        pk_file.write(objectToBytes(public_key, group))

    print("Les cles ont ete enregistre avec succes en binaire !")


if __name__=="__main__":
    keygen()