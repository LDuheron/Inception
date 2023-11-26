FROM debian:bullseye

RUN apt-get update -y && apt-get install -y nginx \
                                            openssl

RUN mkdir -p /etc/nginx/ssl \
            /var/run/nginx

RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html \
    && chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/init_nginx.sh ./
RUN chmod +x ./init_nginx.sh

ENTRYPOINT ["bash", "./init_nginx.sh"]