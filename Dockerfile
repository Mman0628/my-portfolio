FROM php:8.4-cli

RUN apt-get update && apt-get install -y \
    git curl zip unzip libzip-dev libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring zip fileinfo xml

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs

WORKDIR /app

COPY . .

RUN composer install --no-dev --optimize-autoloader --no-interaction

RUN npm ci && npm run build

RUN cp .env.example .env

EXPOSE 8080

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["touch /tmp/database.sqlite && php artisan key:generate && php artisan migrate --force || true && exec php -S 0.0.0.0:${PORT:-8080} -t public"]