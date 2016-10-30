---
layout: page
title: Server preparation for Ubuntu 14.x
permalink: /server-prep-ubu-14/
---


## 1a. Ubuntu

First, make sure your server is up to date:

```
sudo apt-get update; sudo apt-get upgrade
```

Then, install MySQL:

```
sudo apt-get install -y mysql-server
sudo mysql_install_db; sudo mysql_secure_installation
```

If everything works as intended you have created a root user for MySQL and a password. Maybe you had MySQL already.

Ubuntu 16 and higher come with PHP 7. You're set! If you do not run Ubuntu 16 or higher, use these commands to install PHP 7:


```
sudo apt-get install -y language-pack-en-base
sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

sudo apt-get update;sudo apt-get upgrade

sudo apt-get install -y php7.0 php7.0-cli php7.0-common php7.0-fpm php7.0-mysql php7.0-curl php7.0-gd php7.0-imap php7.0-intl php7.0-json php7.0-mcrypt php7.0-readline php7.0-tidy php7.0-zip php7.0-bcmath php7.0-xml php7.0-mbstring php7.0-sqlite php7.0-bz2

```

Either way, install composer by using the following command.


```
cd ~; wget https://getcomposer.org/download/1.0.2/composer.phar; chmod +x composer.phar; sudo mv composer.phar /usr/local/bin/composer; sudo composer selfupdate

```