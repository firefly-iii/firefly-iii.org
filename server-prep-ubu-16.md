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
Ubuntu 16 and higher comes with PHP 7. You should be set!

If this is not the case, let me know so I can change this installation guide.

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
