import os
from charm.toolbox.pairinggroup import PairingGroup, GT
from charm.schemes.abenc.abenc_bsw07 import CPabe_BSW07
from charm.core.engine.util import objectToBytes, bytesToObject
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad
from Crypto.Random import get_random_bytes
import json
import base64
from Crypto.Hash import SHA256

def aes_encrypt(key: bytes, plaintext: str) -> bytes:
    """Chiffre un texte avec AES-CBC"""
    iv = get_random_bytes(16)
    cipher = AES.new(key, AES.MODE_CBC, iv)
    ciphertext = cipher.encrypt(pad(plaintext.encode(), AES.block_size))
    return iv + ciphertext  # concatène IV + ciphertext

def encrypt_hybrid(message: str, policy: str, pk_file: str, output_file: str):
    group = PairingGroup('MNT224')
    cpabe = CPabe_BSW07(group)

    with open(pk_file, 'rb') as f:
        pk = bytesToObject(f.read(), group)

    # 1. Générer un élément aléatoire dans GT
    gt_key = group.random(GT)

    # 2. Dériver une clé AES à partir de cet élément
    raw = objectToBytes(gt_key, group)
    aes_key = SHA256.new(raw).digest()  # 32 bytes

    # 3. Chiffrer le message avec AES
    ciphertext_aes = aes_encrypt(aes_key, message)

    # 4. Chiffrer l'élément GT avec CP-ABE
    ct_cpabe = cpabe.encrypt(pk, gt_key, policy)

    # 5. Sérialisation
    result = {
        "abe_cipher": base64.b64encode(objectToBytes(ct_cpabe, group)).decode(),
        "aes_cipher": base64.b64encode(ciphertext_aes).decode()
    }

    with open(output_file, "w") as f:
        json.dump(result, f, indent=2)

    print(f"Message chiffre et sauvegarde dans : {output_file}")

if __name__ == "__main__":
    base_path = os.path.dirname(os.path.abspath(__file__))
    key_folder = os.path.join(base_path, "../keys/")
    message_folder = os.path.join(base_path, "../messages/")
    os.makedirs(message_folder, exist_ok=True)

    pk_path = os.path.join(key_folder, "public_key.pk")
    output_path = os.path.join(message_folder, "msg.abe")

    message = "Document confidentiel pour UQAC"
    policy = "(FORENSIQUE and UQAC)"

    encrypt_hybrid(message, policy, pk_path, output_path)
