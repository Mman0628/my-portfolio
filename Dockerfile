FROM php:8.4-cli

# Install system dependencies + PHP extensions
RUN apt-get update && apt-get install -y \
    git curl zip unzip libzip-dev libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring zip fileinfo xml \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs

WORKDIR /app

# Copy project
COPY . .

# Install PHP deps
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Build frontend assets
RUN npm ci && npm run build

# Ensure storage + cache are writable
RUN chmod -R 775 storage bootstrap/cache || true

EXPOSE 8080

# Start Laravel properly
CMD mkdir -p database && \
    touch database/database.sqlite && \
    php artisan config:clear && \
    php artisan route:clear && \
    php artisan view:clear && \
    php artisan migrate --force && \
    php -S 0.0.0.0:${PORT:-8080} -t public