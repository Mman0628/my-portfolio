#!/bin/bash

echo "=== Starting Laravel Portfolio ==="
echo "PORT: $PORT"

cd /app

cp .env.example .env

# Write environment values
sed -i "s|APP_KEY=.*|APP_KEY=${APP_KEY}|g" .env
sed -i "s|APP_URL=.*|APP_URL=${APP_URL}|g" .env
sed -i "s|APP_ENV=.*|APP_ENV=${APP_ENV}|g" .env
sed -i "s|APP_DEBUG=.*|APP_DEBUG=${APP_DEBUG}|g" .env
sed -i "s|DB_CONNECTION=.*|DB_CONNECTION=sqlite|g" .env

# Setup SQLite
touch /tmp/database.sqlite
sed -i "s|DB_DATABASE=.*|DB_DATABASE=/tmp/database.sqlite|g" .env

echo "=== Running migrations ==="
php artisan migrate --force || true

echo "=== Starting server on port ${PORT} ==="
exec php -S "0.0.0.0:${PORT}" -t public