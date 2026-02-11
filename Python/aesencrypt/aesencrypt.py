from os import urandom 
from Crypto.Cipher import AES 

def encrypt(key,message):

    cipher = AES.new(key,AES.MODE_EAX) 
    nonce = cipher.nonce 
    ciphertext, tag = cipher.encrypt_and_digest(message) 
    return ciphertext, tag, nonce 

def decrypt(key,ciphertext,tag,nonce): 
    cipher = AES.new(key,AES.MODE_EAX, nonce=nonce) 
    plaintext=cipher.decrypt_and_verify(ciphertext,tag)
    return plaintext


message="sometext123".encode("utf-8") 
key=urandom(32) 
ciphertext,tag,nonce=encrypt(key,message)
print(f"Encrypted text: {ciphertext}")

message_decrypted=decrypt(key,ciphertext,tag,nonce).decode("utf-8") 
print(f"Decrypted text: {message_decrypted}")


