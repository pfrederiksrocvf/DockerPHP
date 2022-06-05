# Eerst importeren we een bestaande PHP image met Apache
FROM php:7.2-apache

# Dan kopiëren we de huidige folder naar de www-folder in onze container (waar Apache de webbestanden heeft staan)
COPY . /var/www

# Dan exposen we poort 80
EXPOSE 80

# Tot slot installeren we een aantal zaken op onze Ubuntu server...

# Eerst de PDO extensie
RUN docker-php-ext-install pdo pdo_mysql
# Dan Git
RUN apt-get update
RUN apt-get install git -y
# Dan Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
# Dan Delight-IM/Auth
RUN composer require delight-im/auth

