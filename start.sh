#!/bin/bash

echo "=== PORT value is: [$PORT] ==="
echo "=== All env vars ==="
env | grep -E "PORT|APP_"

LISTEN_PORT=${PORT:-8080}
echo "=== Using port: $LISTEN_PORT ==="

cd /app

cp .env.example .env

sed -i "s|APP_KEY=.*|APP_KEY=${APP_KEY}|g" .env
sed -i "s|APP_URL=.*|APP_URL=${APP_URL}|g" .env
sed -i "s|APP_ENV=.*|APP_ENV=production|g" .env
sed -i "s|APP_DEBUG=.*|APP_DEBUG=false|g" .env
sed -i "s|DB_CONNECTION=.*|DB_CONNECTION=sqlite|g" .env

touch /tmp/database.sqlite
sed -i "s|DB_DATABASE=.*|DB_DATABASE=/tmp/database.sqlite|g" .env

php artisan migrate --force || true

echo "=== Starting PHP server on 0.0.0.0:${LISTEN_PORT} ==="
exec php -S "0.0.0.0:${LISTEN_PORT}" -t public