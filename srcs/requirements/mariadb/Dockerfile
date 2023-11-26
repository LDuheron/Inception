FROM debian:bullseye


RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server \
    && apt-get install -y mariadb-client \
    && apt-get install -y procps

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld \
    && mkdir -p /var/lib/mysql \
    && chown mysql:mysql /var/run/mysqld/ \
    && chmod -R 755 /var/run/mysqld/ \
    && chown mysql:mysql /var/lib/mysql/ \
    && chmod -R 755 /var/lib/mysql/

EXPOSE 3306

COPY ./tools/dbscript.sh ./
RUN chmod +x ./dbscript.sh

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["bash", "./dbscript.sh"]