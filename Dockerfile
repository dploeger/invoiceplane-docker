FROM php:7.2-apache

RUN apt-get update
RUN apt-get install -y libpng-dev unzip wget gpg
RUN docker-php-ext-install gd pdo_mysql zip
RUN a2enmod rewrite

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g grunt-cli

COPY install_composer.sh /
RUN bash /install_composer.sh

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

COPY trustedproxy.php /

EXPOSE 80

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
