FROM nginx:1.29.1-alpine
ADD index.html /usr/share/nginx/html/index.html
EXPOSE 80