import os
import json
import base64
from charm.toolbox.pairinggroup import PairingGroup, GT
from charm.schemes.abenc.abenc_bsw07 import CPabe_BSW07
from charm.core.engine.util import objectToBytes, bytesToObject
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

from Crypto.Hash import SHA256

def derive_aes_key(gt_element, group) -> bytes:
    """Dérive une clé AES-256 à partir d’un élément GT"""
    raw = objectToBytes(gt_element, group)
    return SHA256.new(raw).digest()

def aes_decrypt(key: bytes, ciphertext: bytes) -> str:
    """Déchiffre un texte avec AES-CBC"""
    iv = ciphertext[:16]
    actual_ciphertext = ciphertext[16:]
    cipher = AES.new(key, AES.MODE_CBC, iv)
    plaintext = unpad(cipher.decrypt(actual_ciphertext), AES.block_size)
    return plaintext.decode()

def decrypt_message(ct_file, pk_file, sk_file):
    group = PairingGroup('MNT224')
    cpabe = CPabe_BSW07(group)
    
    # Lecture des clés
    with open(pk_file, 'rb') as f:
        pk = bytesToObject(f.read(), group)
    with open(sk_file, 'rb') as f:
        sk = bytesToObject(f.read(), group)

    # Chargement du fichier chiffré
    with open(ct_file, 'r') as f:
        data = json.load(f)
    
    ct_cpabe_bytes = base64.b64decode(data['abe_cipher'])
    aes_ciphertext = base64.b64decode(data['aes_cipher'])
    
    # Désérialisation du chiffré ABE
    ct_cpabe = bytesToObject(ct_cpabe_bytes, group)
    
    # Déchiffrement de la clé dans GT
    aes_key_element = cpabe.decrypt(pk, sk, ct_cpabe)
    
    if aes_key_element is None:
        raise Exception("Echec du dechiffrement ABE : attributs insuffisants ?")

    # Dérivation de la clé AES
    aes_key_raw = derive_aes_key(aes_key_element, group)

    # Déchiffrement AES
    plaintext = aes_decrypt(aes_key_raw, aes_ciphertext)
    
    return plaintext

if __name__ == "__main__":
    base_path = os.path.dirname(os.path.abspath(__file__))
    key_folder = os.path.join(base_path, "../keys/")
    users_folder=os.path.join(base_path, "../users-keys/")
    message_folder = os.path.join(base_path, "../messages/")

    pk_path = os.path.join(key_folder, "public_key.pk")
    alice_path = os.path.join(users_folder, "alice.sk")
    bob_path = os.path.join(users_folder, "bob.sk")
    ct_path = os.path.join(message_folder, "msg.abe")

    print("Alice dont les attributs sont UQAC et Crypto) essaye de dechiffrer le message")
    try:
        result = decrypt_message(ct_path, pk_path, alice_path)
        print("Message dechiffre :", result)
    except Exception as e:
        print("Erreur lors du dechiffrement :", e)
        
    print("Bob dont les attributs sont UQAC et Forensique) essaye de dechiffrer le message")
    try:
        result = decrypt_message(ct_path, pk_path, bob_path)
        print("Message dechiffre :", result)
    except Exception as e:
        print("Erreur lors du dechiffrement :", e)
