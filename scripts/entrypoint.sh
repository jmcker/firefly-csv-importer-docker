#!/bin/bash

echo "Now in entrypoint.sh for Firefly III CSV importer"

# make sure the correct directories exists (suggested by @chrif):
echo "Making directories..."
mkdir -p $HOMEPATH/storage/app/public
mkdir -p $HOMEPATH/storage/build
mkdir -p $HOMEPATH/storage/database
mkdir -p $HOMEPATH/storage/debugbar
mkdir -p $HOMEPATH/storage/export
mkdir -p $HOMEPATH/storage/framework/cache/data
mkdir -p $HOMEPATH/storage/framework/sessions
mkdir -p $HOMEPATH/storage/framework/testing
mkdir -p $HOMEPATH/storage/framework/views/twig
mkdir -p $HOMEPATH/storage/framework/views/v1
mkdir -p $HOMEPATH/storage/framework/views/v2
mkdir -p $HOMEPATH/storage/logs
mkdir -p $HOMEPATH/storage/upload

# make sure we own the volumes:
echo "Run chown on storage..."
chown -R www-data:www-data -R $HOMEPATH/storage
echo "Run chmod on storage..."
chmod -R 775 $HOMEPATH/storage

# remove any lingering files that may break upgrades:
echo "Remove log file..."
rm -f $HOMEPATH/storage/logs/laravel.log

echo "Dump auto load..."
composer dump-autoload
echo "Discover packages..."
php artisan package:discover

echo "Run various artisan commands..."
php artisan cache:clear
php artisan config:cache

echo "Run chown"
chown -R www-data:www-data -R $HOMEPATH

echo "Go!"
exec apache2-foreground
