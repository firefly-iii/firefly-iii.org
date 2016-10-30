---
layout: page
title: Server preparation for Ubuntu 14.x
permalink: /server-prep-ubu-14/
---

# Ubuntu 14.x

First, make sure your server is up to date:

```
sudo apt-get update; sudo apt-get upgrade
```

## Install MySQL

```
sudo apt-get install -y mysql-server
sudo mysql_install_db
sudo mysql_secure_installation
```

If everything works as intended you have created a root user for MySQL and a password. Maybe you had MySQL already.

## Install PHP 7.0


```
sudo apt-get install -y language-pack-en-base
sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y php7.0 php7.0-cli php7.0-common php7.0-fpm php7.0-mysql
sudo apt-get install -y php7.0-curl php7.0-gd php7.0-imap php7.0-intl php7.0-json 
sudo apt-get install -y php7.0-mcrypt php7.0-readline php7.0-tidy php7.0-zip php7.0-bcmath 
sudo apt-get install -y php7.0-xml php7.0-mbstring php7.0-sqlite php7.0-bz2

```

Verify your PHP version:

```
php -v
```

Should return something like:

```
PHP 7.0.8-0ubuntu0.16.04.3 (cli) ( NTS )
```

## Install composer

Install composer

```
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

```

## Continue with the installation

See the [installation guide](/installation-guide).