# CP-ABE Message Encryption App

This application is a minimal prototype designed to illustrate the core principle of **Ciphertext-Policy Attribute-Based Encryption (CP-ABE)** using the [Charm-Crypto](https://github.com/JHUISI/charm) library. It combines CP-ABE with symmetric encryption (AES) and offers a basic graphical interface for experimentation.

The application consists of two independent components: an **Admin** interface and a **User** interface.

---

## Objectives

The sole purpose of this project is to highlight how CP-ABE can be used to enforce access control over encrypted data. It is not intended for production use and deliberately omits security layers such as authentication, authorization, or secure communication protocols.

All data (keys, encrypted messages) is exchanged via shared Docker volumes. There is no user verification, no key management protocol, and no network communication between users.

---

## Admin Component

The admin interface is responsible for:

- Generating the **public key** and **master secret key**
- Creating **users** by generating decryption keys associated with a set of attributes

---

## User Component

Each user can:

- **Encrypt** messages using the public key and a custom CP-ABE access policy (e.g., `UQAC and CRYPTO`)
- **Attempt to decrypt** any message stored in the shared `messages/` directory, using their attribute-based private key

Decryption is only possible if the user's attributes satisfy the policy under which the message was encrypted.

---

## Technologies

- Python 3.10  
- [Charm-Crypto](https://github.com/JHUISI/charm) (for CP-ABE)  
- [PyCryptodome](https://pycryptodome.readthedocs.io/en/latest/) (for AES encryption)  
- Tkinter (for GUI)  
- Docker & Docker Compose  
- VcXsrv (for X11 GUI support on Windows hosts)  

---

## Requirements (Windows Host Only)

The application uses **X11** to display GUI windows from within Docker containers.

On Windows, you must install and configure **VcXsrv**:

1. Download and install VcXsrv:  
   [https://sourceforge.net/projects/vcxsrv/](https://sourceforge.net/projects/vcxsrv/)

2. Launch VcXsrv with the following options:
   - **Multiple windows**
   - **Start no client**
   - **Disable access control** (must be checked)

---

## Running the Application

1. **Clone the repository**:
  ```bash
   git clone https://github.com/MaloGdC/Crypto_ABE.git
   cd Crypto_ABE
 ```

3. **Start the application**:
  ```bash
  docker-compose up -d
```

If VcXsrv is properly configured, two windows will appear: one for the Admin and one for the User interface.

## Limitations

No authentication or identity management is implemented. Any user can create keys or encrypt messages without restriction.
No secure key distribution or communication protocol is used. All files (keys, messages) are passed via shared volumes.
This prototype is not designed for production and is only meant for educational or demonstration purposes.
  
