---
layout: page
title: Upgrade guide
redirect_from:
  - /about-ff/upgrade-guide/
  - /upgrade-guide/
---

Firefly III has had a long and stormy history. There are two ways of installing Firefly III, so there are two ways to upgrade:

When something doesn't work, please check [the FAQ]({{ 'faq-technical.html' | absolute_url }}).

## Installed Firefly using "create-project"

The best way to upgrade is to "reinstall" Firefly III using the following command:

* `composer create-project grumpydictator/firefly-iii --no-dev --prefer-dist firefly-iii-updated 4.6.6`

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
* `cd ..`

To make sure your webserver serves you the new Firefly III:

* `mv firefly-iii firefly-iii-old`
* `mv firefly-iii-updated firefly-iii`

If you get 500 errors or other problems, you may have to set the correct access rights:

* `sudo chown -R www-data:www-data firefly-iii`
* `sudo chmod -R 775 firefly-iii/storage`

Make sure you remove the PHP7.0 packages or at least, make sure they are not used by Apache and/or nginx. To disable PHP 7.0 in Apache, you can use:

* `sudo a2dismod php7.0`
* `sudo a2enmod php7.1`
* `sudo service apache2 restart`

This assumes you run Apache and your OS package manager can handle multiple PHP versions (not all of them do this). Other commands can be found using a search engine.

## Installed Firefly using Git

_Backup your entire installation directory, and database first._

Go to the `firefly-iii` folder and run these commands:

* `git pull`
* `rm -rf bootstrap/cache/*`
* `rm -rf bootstrap/cache/*`
* `rm -rf vendor/`
* `composer install --no-scripts --no-dev`
* `composer install --no-dev`
* `php artisan migrate --env=production`
  * Answer yes when asked.
* `php artisan cache:clear`
* `php artisan firefly:upgrade-database`

## Common upgrade problems

### Upgrading from a very old version

When you have used Firefly for a long time you will find it can be difficult to upgrade. The database migrations may no longer work or other problems pop up. Here is what user [@webenhanced](https://github.com/webenhanced) did when upgrading from version 3.7 to 4.3. Quite a big step.

* Renamed `firefly-iii` directory to `firefly-iii-3.7`
* Renamed `firefly` DB to `firefly_3.7`
* Created new DB named `firefly` (with same user)
* Run `composer create-project grumpydictator/firefly-iii --no-dev --prefer-dist firefly-iii 4.6.6`
* Merged `firefly-iii-3.7/.env` into `firefly-iii/.env`
* Run `php artisan migrate --seed --env=production`
* Using phpMyAdmin, exported new firefly DB structure only and used the SQL file in an editor as a reference
* Adjusted each column in each table of the `firefly_3.7` DB with new definitions to match the newly created `firefly` DB
* Removed, added, or edited all the CONSTRAINTS using phpMyAdmin "Relation View"
* Removed no longer used tables and columns
( Renamed `firefly` DB to `firefly_4.3dist`
* Copied `firefly_3.7` DB to a new `firefly` (so now we are using the original DB with 4.3 structure updates)
* Run `php artisan cache:clear`
* Run `php artisan firefly:upgrade-database` (this did something to the entries in budget_limits table)
* Navigated in the browser to the site.

### The database stores no more than 4 decimals

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
