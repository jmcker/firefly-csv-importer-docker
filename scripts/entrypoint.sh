#!/bin/bash

echo "Now in entrypoint.sh (v1.2) for Firefly III CSV importer."
echo "Please wait for the container to start..."

# make sure the correct directories exists (suggested by @chrif):
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
chown -R www-data:www-data -R $HOMEPATH/storage
chmod -R 775 $HOMEPATH/storage

# remove any lingering files that may break upgrades:
rm -f $HOMEPATH/storage/logs/laravel.log

composer dump-autoload > /dev/null 2>&1
php artisan package:discover > /dev/null 2>&1
php artisan cache:clear > /dev/null 2>&1
php artisan config:cache > /dev/null 2>&1
chown -R www-data:www-data -R $HOMEPATH
php artisan csv:version

if [ "$WEB_SERVER" == "false" ]; then
	echo "Will launch auto import on /import directory."
	php artisan csv:auto-import /import
else
	echo "Will now run Apache web server:"
	exec apache2-foreground
fi
