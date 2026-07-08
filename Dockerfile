FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

# Copiamos nuestro script y le damos permisos
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html

# Instalación de dependencias
RUN composer install --no-dev --optimize-autoloader && \
    chmod -R 777 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache

ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false

# ESTA ES LA CLAVE: 
# La imagen usa esta variable para saber qué ejecutar al iniciar
ENV STARTUP_COMMAND="/entrypoint.sh"

EXPOSE 80