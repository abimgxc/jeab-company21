FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

# Instalación optimizada
RUN composer install --no-dev --optimize-autoloader && \
    chmod -R 777 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache

# --- EL CAMBIO CRUCIAL ---
# Ejecutamos el clear de rutas justo antes de que el contenedor se declare "Ready"
ENV PRE_START_COMMAND="php artisan route:clear && php artisan config:clear"

ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false
ENV SKIP_COMPOSER=1

EXPOSE 80