#!/bin/bash

cd /var/www;
mysql scotchbox -u root -proot < serienreminder.sql;
composer self-update;
composer install;
php bin/console series:import;