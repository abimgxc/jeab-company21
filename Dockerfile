FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

# Instalación de dependencias y permisos
RUN composer install --no-dev --optimize-autoloader \
    && chmod -R 777 storage bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache

# --- AQUÍ ESTÁ LA CORRECCIÓN ---
# Creamos un script de arranque que se ejecutará al iniciar el contenedor
RUN echo '#!/bin/sh' > /start.sh && \
    echo 'php artisan route:clear' >> /start.sh && \
    echo 'php artisan config:clear' >> /start.sh && \
    echo 'php artisan view:clear' >> /start.sh && \
    echo 'php artisan migrate --force' >> /start.sh && \
    echo '/usr/bin/supervisord -c /etc/supervisor/supervisord.conf' >> /start.sh && \
    chmod +x /start.sh

ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false

EXPOSE 80

# Usamos nuestro script de inicio en lugar de llamar a supervisord directamente
CMD ["/start.sh"]