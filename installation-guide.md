---
layout: page
title: Installation guide
permalink: /installation-guide/
---

# Introduction
This installation guide focuses on the installation of [Firefly III](https://github.com/firefly-iii/firefly-iii) only.

If you need to upgrade, check out the [upgrade guide](https://firefly-iii.github.io/upgrade-guide/). If something is not working, checkout the [FAQ](/installation-guide-faq/)!

If you want to install Firefly III using Docker, checkout the [Docker instructions](https://firefly-iii.github.io/installation-guide-docker/).

The installation guide is just three steps!

## Prerequisites
You need a working LAMP, LEMP or WAMP stack. If you don't have one, search the web to find out how to get one. Make sure you're running PHP 7.0. There are many tutorials that will help you install one. For example:

1. [A guide to install a LAMP stack](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu)
2. [A guide to update to PHP 7.0](https://www.digitalocean.com/community/questions/how-do-i-update-my-lamp-stack-to-php7)

You also need an email address and the associated password and server settings. You can safely use your own email address. If you prefer not to, you can register a free email account at [GMail](https://accounts.google.com/SignUp?service=mail) or [Outlook](https://outlook.live.com/owa/)

## 1. Preparing your server

### Extra packages

Install the following PHP modules:

* PHP BCMath Arbitrary Precision Mathematics
* PHP Mcrypt
* PHP Internationalization extension
* PHP MBstring
* PHP Curl

You can search the web to find out how to install these modules. Some may be installed already.

### Apache configuration

If you run Apache, open the `httpd.conf` or `apache2.conf` configuration file (its location differs, but it is probably in `/etc/apache2`).

Find the line that starts with `<Directory /var/www>`. If you see `/`, keep looking!

You will see the text `AllowOverride None` right below it. Change it to `AllowOverride All`.

Also run the following commands:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### nginx configuration

If you run nginx, the configuration should be fine. You'll just have to search the web on how to run PHP7 in nginx. You can check out [my own nginx configuration](/static/nginx.txt).

### Installing composer

If you have sudo rights (try `sudo ls`) you can install composer using the following command:

```
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
```

Verify the installation of composer using the following command.

```
composer -v
```

This concludes the server preparations!

## 2. Installing Firefly

### Main command

Browse to `/var/www` which is probably the directory where your web server is configured to find its files.

Enter the following command. 

```
composer create-project grumpydictator/firefly-iii --no-dev --prefer-dist --no-suggest
```

If this gives an error because of access rights, prepend the command with `sudo `. We'll fix the access rights later. The output of this command must look something like [this example](/static/installation-output.txt).

### Configuration

In the `firefly-iii` directory you will find a `.env` file. Open this file using your favorite editor.

In the list below you will see each value in this file and what you must put there. If a value from the `.env` file is not mentioned, you should ignore it.

Field | Meaning
----- | -------
`APP_DEBUG` | Set this to true when you file a bug. It will enable detailed errors.
`APP_FORCE_SSL` | Firefly III knows if you use http or https. To force https, set this to true.
`APP_FORCE_ROOT` | Firefly III knows its own web address. If it is mistaken, fill in this field
`APP_LOG_LEVEL` | Change this to get more detailed logging.
`DB_*` | Change this to match your database settings.
`COOKIE_PATH` | Tie the cookies to a specific path if necessary
`COOKIE_DOMAIN` | Tie the cookies to a specific domain if necessary
`COOKIE_SECURE` | Only use cookies over https (off by default)
`MAIL_*` | Update this to reflect your email settings.
`SHOW_INCOMPLETE_TRANSLATIONS` | Set this to true if you want to use incomplete translations.
`GOOGLE_MAPS_API_KEY` | You _may_ fill this in if you expect your Firefly III installation to contain and show over 10.000 tags.
`ANALYTICS_ID` | If you want to see analytics for your own Firefly III installation
`SITE_OWNER` | **Important** Fill in your email address.
`DEMO_USERNAME` | Leave empty!
`DEMO_PASSWORD` | Leave empty!

### Initialize the database

This step is very important, because Firefly III needs a database to work with and it will tell you whether or not your configuration is correct. Run the following command:

```
php artisan migrate:refresh --seed
```

### Make sure the web server user has access rights.
Especially when you install Firefly III using `sudo`, the web server may not have (write) access to the Firefly III directory. To make sure that the webserver can run Firefly, run the following commands:

```
sudo chown -R www-data:www-data /var/www/firefly-iii
sudo chmod -R 775 /var/www/firefly-iii/storage
```

Now you should be able to visit [http://localhost/firefly-iii**/public**](http://localhost/firefly-iii/public) and see Firefly.

## 3. Accessing Firefly
### Browsing to site
Browsing to the site should be easy. You should see a login screen. If you see empty pages, or "Whoops" errors, open the `.env` file again and change `APP_DEBUG` from `false` to `true`. Also change `APP_LOG_LEVEL` to `debug`. This will give you some insight in what is happening. If you don't know what to do, [open an issue](https://github.com/firefly-iii/firefly-iii/issues/new) and I will help you.

### Registering an account
You cannot login yet. Click on "Register a new account" and fill in the form.

### Your first accounts
You will be logged in automatically. Follow the instructions and you are done!