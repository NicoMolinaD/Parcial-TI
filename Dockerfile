# Usa una imagen más ligera y segura
FROM node:20-alpine

# Establece directorio de trabajo
WORKDIR /usr/src/app

# Copia los archivos de dependencias
COPY package*.json ./

# Instala dependencias
RUN npm install

# Copia el resto del código
COPY . .

# Expone el puerto de la app
EXPOSE 3000

RUN npm install --ignore-scripts --force
RUN rm -rf /root/.npm/_cacache

# Comando por defecto
CMD ["npm", "start"]
