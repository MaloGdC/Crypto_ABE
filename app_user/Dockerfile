FROM ubuntu:18.04
MAINTAINER support@charm-crypto.com

RUN apt update && apt install --yes build-essential flex bison wget subversion m4 python3 python3-dev python3-setuptools libgmp-dev libssl-dev
RUN wget https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz && tar xvf pbc-0.5.14.tar.gz && cd /pbc-0.5.14 && ./configure LDFLAGS="-lgmp" && make && make install && ldconfig
COPY ./charm /charm
RUN cd /charm && ./configure.sh && make && make install && ldconfig
RUN apt install -y python3-pip
RUN pip3 install pycryptodome

# Dossier de travail pour tes scripts
WORKDIR /app

# Copier tes scripts Python
COPY ./app_user/src ./src

# Créer les dossiers qui seront montés comme volumes
RUN mkdir -p /app/keys /app/users-keys /app/messages

# Par défaut : ouvrir un shell
CMD ["bash"]
