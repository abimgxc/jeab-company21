FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

# Instalación de dependencias
RUN composer install --no-dev --optimize-autoloader && \
    chmod -R 777 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache

ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false

# --- EL CAMBIO CRUCIAL ---
# Ejecutamos las migraciones primero, y luego el comando original de la imagen
# El comando original de esta imagen base es: /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
CMD php artisan migrate --force && \
    php artisan route:clear && \
    /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

EXPOSE 80