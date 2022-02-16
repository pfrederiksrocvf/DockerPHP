# Eerst importeren we een bestaande PHP image met Apache
FROM php:7.4-apache

# Dan kopiëren we de huidige folder naar de www-folder in onze container (waar Apache de webbestanden heeft staan)
COPY . /var/www

# Dan exposen we poort 80
EXPOSE 80

# Tot slot installeren we de PDO extensie
RUN docker-php-ext-install pdo pdo_mysql

