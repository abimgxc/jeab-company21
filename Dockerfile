FROM richarvey/nginx-php-fpm:3.1.6

COPY . /var/www/html

COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

RUN composer install --no-dev --optimize-autoloader \
    && (php artisan storage:link || true) \
    && mkdir -p storage/framework/views \
       storage/framework/cache \
       storage/framework/sessions \
       storage/logs \
       bootstrap/cache \
    && touch storage/logs/laravel.log \
    && chmod -R 777 storage bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache

ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false

EXPOSE 80