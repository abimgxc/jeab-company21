FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www/html

RUN composer install --no-dev --optimize-autoloader && \
    chmod -R 777 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache

ENV SKIP_COMPOSER=1
ENV PHP_ERRORS_STDERR=1
ENV PHP_PM_MAX_CHILDREN=10

EXPOSE 80
# ELIMINA LA LINEA CMD AQUÍ. NO LA NECESITAMOS.