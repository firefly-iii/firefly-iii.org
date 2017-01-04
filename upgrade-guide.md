---
layout: page
title: Upgrade guide
permalink: /upgrade-guide/
---

Firefly III has had a long and stormy history. There are two ways of installing Firefly III, so there are two ways to upgrade:

## Installed Firefly using "create-project"

Todo.

## Installed Firefly using Git

* Go to the `firefly-iii` folder.
* Run `git pull`
* Run `rm -rf bootstrap/cache/*`
* Run `php artisan migrate --env=production`
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
* Run `php artisan cache:clear`
* Run `php artisan firefly:upgrade-database`