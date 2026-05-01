#!/bin/bash
set -e

echo "=== Starting Laravel Portfolio ==="
echo "PORT: $PORT"
echo "APP_KEY set: ${APP_KEY:+yes}"

cd /app

echo "=== Copying .env ==="
cp .env.example .env

echo "=== Writing env values ==="
sed -i "s|APP_KEY=.*|APP_KEY=$APP_KEY|g" .env
sed -i "s|APP_URL=.*|APP_URL=$APP_URL|g" .env
sed -i "s|APP_ENV=.*|APP_ENV=$APP_ENV|g" .env
sed -i "s|APP_DEBUG=.*|APP_DEBUG=$APP_DEBUG|g" .env
sed -i "s|DB_CONNECTION=.*|DB_CONNECTION=sqlite|g" .env

echo "=== Creating SQLite DB ==="
touch /tmp/database.sqlite
sed -i "s|DB_DATABASE=.*|DB_DATABASE=/tmp/database.sqlite|g" .env

echo "=== Running migrations ==="
php artisan migrate --force || echo "Migration failed, continuing..."

echo "=== Optimizing ==="
php artisan optimize || echo "Optimize failed, continuing..."

echo "=== Starting server on port $PORT ==="
php -S 0.0.0.0:$PORT -t public