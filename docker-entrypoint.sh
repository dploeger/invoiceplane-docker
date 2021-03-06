#!/bin/bash

echo "## Preparing InvoicePlane"

cd /var/www/html && php /composer.phar install --no-dev
cd /var/www/html && npm install
cd /var/www/html && grunt build

chmod -R 0777 /var/www/html/storage
chmod -R 0777 /var/www/html/bootstrap/cache

echo "## InvoicePlane is ready! Starting Web server..."

docker-php-entrypoint $@
