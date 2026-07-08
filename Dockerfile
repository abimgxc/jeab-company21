FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

# 1. Instalación y permisos
RUN composer install --no-dev --optimize-autoloader && \
    chmod -R 777 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache

# 2. USAMOS LA VARIABLE OFICIAL DE LA IMAGEN
# Esta imagen ejecuta automáticamente cualquier script que le indiques aquí
# antes de iniciar sus servicios internos.
ENV PRE_START_COMMAND="php artisan migrate --force && php artisan route:clear"

ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false

EXPOSE 80