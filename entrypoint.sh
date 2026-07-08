#!/bin/sh
# Limpiar caché y migrar antes de arrancar
php artisan route:clear
php artisan config:clear
php artisan view:clear
php artisan migrate --force

# Ejecutar el comando original de la imagen
exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf