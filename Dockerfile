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
RUN mkdir -p /var/www/html/scripts \
    && echo '#!/bin/bash' > /var/www/html/scripts/00-setup.sh \
    && echo 'php artisan storage:link || true' >> /var/www/html/scripts/00-setup.sh \
    && echo 'php artisan migrate --force' >> /var/www/html/scripts/00-setup.sh \
    && echo 'php artisan db:seed --force' >> /var/www/html/scripts/00-setup.sh \
    && chmod +x /var/www/html/scripts/00-setup.sh

# Configuración Laravel producción
ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false
ENV RE_RUN_COMPOSER true
ENV RUN_SCRIPTS 1

EXPOSE 80