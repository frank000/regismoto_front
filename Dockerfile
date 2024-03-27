# Use uma imagem base do Nginx
FROM nginx:latest

# Copie os arquivos HTML e o arquivo de configuração do Nginx para dentro do contêiner
COPY ./* /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install -y \
    software-properties-common \
    npm
RUN npm install npm@latest -g && \
    npm install n -g && \
    n latest

# confirm installation

RUN cd /usr/share/nginx/html/ && npm install

# Exponha a porta 8080
EXPOSE 8080
