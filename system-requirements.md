---
layout: page
title: System requirements
permalink: /system-requirements/
---

Firefly III requires the following things. 

- PHP 7
- MySQL, SQLite, Postgres or SQL server.
- [PHP BCMath Arbitrary Precision Mathematics](http://php.net/manual/en/book.bc.php), a PHP module.
- [PHP Mcrypt](http://php.net/manual/en/book.mcrypt.php)
- [PHP Internationalization extension](http://php.net/manual/en/intro.intl.php)
- [PHP MBstring](http://php.net/manual/en/book.mbstring.php)
- A GMail address or other mailing facilities.
- Access to [Composer](https://getcomposer.org/)
- Firefly III has a lot of dependencies. It helps if you have a Github account.

Because Firefly III needs some special tools to install it, you must have access to the terminal on your web server. It's simply not enough to have web hosting where you may upload stuff. In theory however, it is possible to do all of this locally and then upload it to your web server.

[Please continue to the installation guide](../installation-guide/).

### Shared webhosting

A lot of people have "shared webhosting", which does not give terminal access or
the ability to run scripts or other fancy stuff. Usually they get FTP access, and
that's it. For those people, I recommend installing a tool called 
[VirtualBox](https://www.virtualbox.org/wiki/Downloads), and/or [Vagrant](https://www.vagrantup.com/).

Then, installing Firefly is something you do inside a Linux virtual machine. When you're done, you
upload the result to your shared webhosting.

[Please continue to the installation guide](../installation-guide/).