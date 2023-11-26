FROM debian:bullseye

RUN apt-get update -y \
    && apt-get install -y nginx \
    && apt-get install -y openssl

RUN mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lduheron.42.fr/UID=lduheron"

RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html \
    && chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]