FROM node:18-alpine

WORKDIR /app

# Copiar archivos de dependencias primero para aprovechar la caché de Docker
COPY package*.json ./
RUN npm install

# Copiar el resto de los archivos
COPY . .

# Compilar la aplicación si es necesario
RUN npm run build

# Puerto que expondrá la aplicación
EXPOSE 8080

# Comando para iniciar la aplicación
CMD ["npm", "start"]
