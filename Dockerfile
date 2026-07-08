FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

# Instalación de dependencias
RUN composer install --no-dev --optimize-autoloader

# Ajuste de permisos (imprescindible)
RUN chmod -R 777 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache

# Configuración de entorno
ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false

# --- LA CLAVE ---
# En lugar de un script CMD, usamos la variable PRE_START_COMMAND 
# que esta imagen soporta nativamente.
ENV PRE_START_COMMAND="php artisan route:clear && php artisan config:clear && php artisan view:clear && php artisan migrate --force"

EXPOSE 80