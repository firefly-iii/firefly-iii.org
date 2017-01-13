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


# Common upgrade problems

## The database stores no more than 4 decimals

Firefly supports up to 12 decimal numbers for currencies (in order to support Bitcoin and other cryptocurrencies). However, your database may not have been migrated correctly. User [@xpfgsyb](https://github.com/xpfgsyb) has kindly provided the following fix.

* Connect to mysql: `mysql -u user -p`
* Switch to the firefly database, change if your setup differs: `use firefly;`
* Check the actual column type of amount: `SHOW COLUMNS FROM transactions;`
* If the type is decimal(14,4), change it with this command: `ALTER TABLE transactions MODIFY COLUMN amount decimal(22,12);`
* Recheck if the type is ok now: `SHOW COLUMNS FROM transactions;`
* Exit: `exit;`

You should repeat this procedure for other tables as well if necessary:

* Table `accounts`, field `virtual_balance`
* Table `available_budgets`, field `amount`
* Table `bills`, fields `amount_min` and `amount_max`
* Table `budget_limits`, field `amount`
* Table `piggy_bank_events`, field `amount`
* Table `piggy_bank_repetitions`, field `currentamount`
* Table `piggy_banks`, field `targetamount`
