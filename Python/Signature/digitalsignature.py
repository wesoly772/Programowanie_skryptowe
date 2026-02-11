from Crypto.Hash import SHA256
from Crypto.PublicKey import RSA
from Crypto.Signature import PKCS1_v1_5
from sys import argv, exit



def usage():
    print("Usage: \n"
          "digitalsignature.py\n-s <file_name> <private_key>  <---- sign a file\n"
          "-v <file_name> <public_key> <signature>  <---- verify a signature\n")



def sign_file(file,private_key_path): 

    try:
        with open(private_key_path,"rb") as f:  
            private_key = RSA.import_key(f.read())
        with open(file,"rb") as f: 
            data = f.read()

    except FileNotFoundError as e:
        print(f"File not found: {e.filename}")
        exit(1)
    

    hash256 = SHA256.new(data) 
    signature = PKCS1_v1_5.new(private_key).sign(hash256)

    with open(f"{file}.sig", "wb") as f: 
        f.write(signature)

    print(f"Podpisano plik!")

def verify_file(file,signature_path,public_key_path): 

    try:
        with open(public_key_path,"rb") as f: 
            public_key = RSA.import_key(f.read())

        with open(file,"rb") as f: 
            data = f.read()
    
        with open(signature_path,"rb") as f: 
            signature=f.read()

    except FileNotFoundError as e:
        print(f"File not found: {e.filename}")
        exit(1)


    hash256 = SHA256.new(data)  
    if PKCS1_v1_5.new(public_key).verify(hash256,signature): 
        print("Sign is valid!")
    else:
        print("Sign not valid!")
    exit(-1)
        



def main():
    if argv[1] == "-s":
        if len(argv) != 4:
            usage()
            exit(1)
        sign_file(argv[2],argv[3])
    elif argv[1] == "-v":
        if len(argv) != 5:
            usage()
            exit(1)
        verify_file(argv[2],argv[4],argv[3])
    else:
        usage()
        exit(1)
    
        
        
        

if __name__ == "__main__":
    main()

