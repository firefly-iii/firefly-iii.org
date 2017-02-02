---
layout: page
title: Installation guide for Ubuntu 14.xx
permalink: /installation-guide/ubuntu-14-xx/
---

# Ubuntu 14.x

First, make sure your server is up to date:

```
sudo apt-get update
sudo apt-get upgrade
```

## Install MySQL

Please follow this [digital ocean tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-14-04) to install MySQL.

## Install MySQL and other packages

Install these packages.

```
sudo apt-get install -y openssh-server
sudo apt-get install -y mysql-server
sudo apt-get install -y git
sudo mysql_secure_installation
sudo apt-get install apache2
sudo /etc/init.d/apache2 start

```

If everything works as intended you have created a root user for MySQL and a password. Maybe you had MySQL already. To create a database and a user for Firefly, you can use a tool like PHPMyAdmin or use the following commands:

```
mysql -u root -p
CREATE DATABASE firefly;
show databases;
create user firefly;
grant all on firefly.* to 'firefly'@'localhost' identified by 'SUPERSECRET';
```

Make sure you remember the username and password. And be careful, the default configuration may be different from what you enter here. Close the tool with Ctrl-Z or type exit / quit.

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

sudo apt-get -y install php7.0 libapache2-mod-php7.0
sudo systemctl restart apache2

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
sudo apt-get install unzip
sudo -i
cd /usr/src
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
exit

```

## Continue with the installation

Please note that this guide for Ubuntu 14.x does not include Apache installation instructions. It's on my TODO list.

See the [installation guide](/installation-guide).
