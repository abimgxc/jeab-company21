FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

# Instalación de dependencias
RUN composer install --no-dev --optimize-autoloader && \
    chmod -R 777 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache

# Generamos el script de arranque internamente
RUN echo '#!/bin/sh' > /startup.sh && \
    echo 'php artisan migrate --force' >> /startup.sh && \
    echo 'php artisan route:clear' >> /startup.sh && \
    echo 'exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf' >> /startup.sh && \
    chmod +x /startup.sh

# Configuramos el entorno
ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false

# Definimos el punto de entrada
ENTRYPOINT ["/startup.sh"]

EXPOSE 80