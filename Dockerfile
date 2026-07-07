FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html

WORKDIR /var/www/html

# Instalar dependencias de Laravel y preparar permisos
RUN composer install --no-dev --optimize-autoloader \
    && mkdir -p storage/framework/views \
       storage/framework/cache \
       storage/framework/sessions \
       storage/logs \
       bootstrap/cache \
    && chmod -R 777 storage bootstrap/cache

# Crear script de inicio para preparar Laravel en Render
RUN composer install --no-dev --optimize-autoloader \
    && mkdir -p storage/framework/views \
       storage/framework/cache \
       storage/framework/sessions \
       storage/logs \
       bootstrap/cache \
    && touch storage/logs/laravel.log \
    && chmod -R 777 storage bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache
    
# Configuración Laravel producción
ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false
ENV RE_RUN_COMPOSER true
ENV RUN_SCRIPTS 1

EXPOSE 80