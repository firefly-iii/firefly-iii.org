---
layout: page
title: Server preparation for Ubuntu 16.x
permalink: /server-prep-ubu-16/
---

# Ubuntu 16.x

First, make sure your server is up to date:

```
sudo apt-get update
sudo apt-get upgrade
```

## Install MySQL

```
sudo apt-get install -y mysql-server
sudo mysql_install_db
sudo mysql_secure_installation
```

If everything works as intended you have created a root user for MySQL and a password. Maybe you had MySQL already.

## Install PHP 7.0
Ubuntu 16 and higher comes with PHP 7. You're set!

Verify your PHP version:

```
php -v
```

## Install composer

Install composer

```
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

```

## Continue with the installation

Please note that this guide for Ubuntu 16.x does not include Apache installation instructions. It's on my TODO list.

See the [installation guide](/installation-guide).