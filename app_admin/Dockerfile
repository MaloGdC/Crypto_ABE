FROM python:3.10-slim

# Mise à jour et installation des dépendances système
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    wget \
    subversion \
    flex \
    bison \
    m4 \
    libgmp-dev \
    libssl-dev \
    python3-tk \
    x11-apps \
    xauth \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Installation de PBC
RUN wget https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz && \
    tar xvf pbc-0.5.14.tar.gz && \
    cd pbc-0.5.14 && \
    ./configure LDFLAGS="-lgmp" && \
    make && make install && ldconfig && \
    cd .. && rm -rf pbc-0.5.14 pbc-0.5.14.tar.gz

# Copier et installer la bibliothèque charm
RUN git clone https://github.com/JHUISI/charm.git /opt/charm && \
    cd /opt/charm && \
    ./configure.sh && \
    make && \
    make install && ldconfig

# Installer les paquets Python
RUN pip install --no-cache-dir pycryptodome

# Dossier de travail
WORKDIR /app

# Copier les scripts
COPY ./app_admin/src ./src

# Créer les dossiers pour les volumes
RUN mkdir -p /app/keys /app/users-keys /app/messages

WORKDIR /app/src

# Point d’entrée par défaut
CMD ["python3", "app.py"]
