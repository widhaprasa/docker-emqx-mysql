FROM mysql:5.7.40-debian

# Add default mysql env
ENV MYSQL_RANDOM_ROOT_PASSWORD=yes
ENV MYSQL_DATABASE=emqx_mysql
ENV MYSQL_USER=emqx_mysql
ENV MYSQL_PASSWORD=emqx_mysql

# Initial database
ADD 001-structure.sql /docker-entrypoint-initdb.d/001-structure.sql
