# A imagem base que irei usar é a Nodje.js do Dockerhub
FROM node:latest

# Setando o diretório no container
WORKDIR /app

# Copiando os arquivos de metadata (package.json e package-lock.json)
COPY package*.json ./

# Instalando as dependencias
RUN npm install 

# Instalando globalmente o vite
RUN npm install -g create-vite

# Persistindo o vite e o save dev
RUN npm install vite --save-dev




