# Utilizando a imagem mais recente do nginx como base para a imagem
FROM nginx 


# Com o arquivo nginx.conf criado copie para dentro da imagem
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Removendo as configurações padrões do nginx
RUN rm -rf /usr/share/nginx/html/*


# Copiando build do react 
COPY /react-app/dist /usr/share/nginx/html

