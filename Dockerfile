FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www/html

RUN composer install --no-dev --optimize-autoloader && \
    chmod -R 777 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache

# --- CONFIGURACIÓN PARA EVITAR REINICIOS ---
# Desactivamos el control de procesos interno que entra en conflicto
ENV SKIP_COMPOSER=1
ENV PHP_ERRORS_STDERR=1
# Aumentamos los límites para que no se sature (lo que vimos antes)
ENV PHP_PM_MAX_CHILDREN=10

# IMPORTANTE: Eliminamos el PRE_START_COMMAND del Dockerfile
# y lo moveremos al panel de Render para que no bloquee el inicio.

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]