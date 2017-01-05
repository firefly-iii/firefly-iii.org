---
layout: page
title: Upgrade guide
permalink: /upgrade-guide/
---

Firefly III has had a long and stormy history. There are two ways of installing Firefly III, so there are two ways to upgrade:

## Installed Firefly using "create-project"

The best way to upgrade is to "reinstall" Firefly III using the following command:

* `composer create-project grumpydictator/firefly-iii --no-dev --prefer-dist firefly-iii-updated`

This installs Firefly III in a new directory called `firefly-iii-updated`. Assuming your _original_ Firefly III installation is in the directory `firefly-iii` you can upgrade by simply moving over your `.env` file and other stuff:

* `cp firefly-iii/.env firefly-iii-updated/.env`
* `cp firefly-iii/storage/upload/* firefly-iii-updated/storage/upload/`
* `cp firefly-iii/storage/export/* firefly-iii-updated/storage/export/`

If you use SQLite as a database system (you will know if you do) copy your database as well. Otherwise the `.env`-file is enough.

Then, run the following commands to finish the upgrade:

* `cd firefly-iii-updated`
* `rm -rf bootstrap/cache/*`
* `php artisan migrate --env=production`
  * Answer yes when asked.
* `php artisan cache:clear`
* `php artisan firefly:upgrade-database`

To make sure your webserver serves you the new Firefly III:

* `mv firefly-iii firefly-iii-old`
* `mv firefly-iii-updated firefly-iii`

## Installed Firefly using Git

* Go to the `firefly-iii` folder.
* Run `git pull`
* Run `rm -rf bootstrap/cache/*`
* Run `php artisan migrate --env=production`
  * Answer yes when asked.
* Run `php artisan cache:clear`
* Run `php artisan firefly:upgrade-database`

## Installed Firefly using Git (alternative)

* Go to the `firefly-iii` folder.
* Run `git pull`
* Run `rm -rf bootstrap/cache/*`
* Run `rm -rf vendor/`
* Run `composer install --no-scripts --no-dev`
* Run `composer install --no-dev`
* Run `php artisan migrate --env=production`
  * Answer yes when asked.
* Run `php artisan cache:clear`
* Run `php artisan firefly:upgrade-database`