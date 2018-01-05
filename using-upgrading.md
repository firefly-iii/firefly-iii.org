---
layout: page
title: Upgrade guide
redirect_from:
  - /about-ff/upgrade-guide/
  - /upgrade-guide/
---

Firefly III has had a long and stormy history. There are many ways of installing Firefly III, so there are many ways to upgrade!

## Docker
### Upgrade straight from Docker Hub
To upgrade, stop your container using 

```
docker stop <container>
```

Then run:

```
docker pull jc5x/ff_exp:latest
```

And then start it again. Use the command you used when you [installed the Docker container]({{ 'using-docker.html' | absolute_url }}).

### Docker Hub via docker compose
To update the container just run `docker-compose restart firefly-app`. You can even add this command to a chrontab.
### Docker Hub via run/pull
To update the container just run `docker stop firefly-app && docker pull jc5x/firefly-iii && docker start firefly-app`. You can even add this command to a chrontab.

## Virtual or real server
### Created using composer "create-project"
The best way to upgrade is to "reinstall" Firefly III using the following command:

* `composer create-project grumpydictator/firefly-iii --no-dev --prefer-dist firefly-iii-updated <next_version>`

Where <next_version> is the latest version of Firefly III. This installs Firefly III in a new directory called `firefly-iii-updated`. Assuming your _original_ Firefly III installation is in the directory `firefly-iii` you can upgrade by simply moving over your `.env` file and other stuff:

```
cp firefly-iii/.env firefly-iii-updated/.env
cp firefly-iii/storage/upload/* firefly-iii-updated/storage/upload/
cp firefly-iii/storage/export/* firefly-iii-updated/storage/export/
```

If you use SQLite as a database system (you will know if you do) copy your database as well. Otherwise the `.env`-file is enough.

Then, run the following commands to finish the upgrade:

```
cd firefly-iii-updated
rm -rf bootstrap/cache/*
php artisan migrate --env=production # Answer yes when asked.
php artisan cache:clear
php artisan firefly:upgrade-database
php artisan firefly:verify
cd ..
```

To make sure your webserver serves you the new Firefly III:

```
mv firefly-iii firefly-iii-old
mv firefly-iii-updated firefly-iii
```

If you get 500 errors or other problems, you may have to set the correct access rights:

```
sudo chown -R www-data:www-data firefly-iii
sudo chmod -R 775 firefly-iii/storage
```

Make sure you remove any old PHP7.0 packages or at least, make sure they are not used by Apache and/or nginx. To disable PHP 7.0 in Apache, you can use:

```
sudo a2dismod php7.0
sudo a2enmod php7.1
sudo service apache2 restart
```

This assumes you run Apache and your OS package manager can handle multiple PHP versions (not all of them do this). Other commands can be found using a search engine.

### Straight from Github
_Backup your entire installation directory, and database first._

Go to the `firefly-iii` folder and run these commands:

```
git pull
rm -rf bootstrap/cache/*
rm -rf vendor/
composer install --no-scripts --no-dev
composer install --no-dev
php artisan migrate --env=production # Answer yes when asked.
php artisan cache:clear
php artisan firefly:upgrade-database
php artisan firefly:verify
```


## Heroku
I am not sure how to upgrade a Heroku instance. I believe they auto-update.

## Sandstorm.io
I am not sure how to upgrade a Sandstorm.io instance. I believe they auto-update.

## AMPPS
I am not sure how to upgrade a AMPPS instance. I believe they auto-update.

## Softaculous
I am not sure how to upgrade a Softaculous instance. I believe they auto-update.


<hr>

When something doesn't work, please check [the FAQ]({{ 'faq-technical.html' | absolute_url }}) or open a [ticket on Github](https://github.com/firefly-iii/firefly-iii/issues).