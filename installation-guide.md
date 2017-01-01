---
layout: page
title: Installation guide
permalink: /installation-guide/
---

# Normal installation

Have you seen the [system requirements](/system-requirements/)? If so, please continue!

## Introduction

The hardest part of this installation manual is installing Apache (or nginx), and PHP 7. Most Linux installations come with PHP 5 so you need to upgrade it.

Installing Firefly III itself is fairly easy, because composer and Laravel are easy to handle.

There is also a [Docker file](/installation-guide-docker/).

### Server preparations

Take your pick:

1. Server preparations for [Ubuntu 14.xx](/server-prep-ubu-14/)
2. Server preparations for [Ubuntu 16.xx](/server-prep-ubu-16/)
3. Server preparations for [CentOS](/server-prep-centos/)

This should get you up and running. Now, follow the "installation steps".

### Installation steps

#### Access your server
SSH into your server, or otherwise access it. If SSH is not installed, please refer back to the server preparations. Beware though, I am not yet sure what the command is to install SSH on a CentOS machine.

#### Create a new database and user account
Use your MySQL credentials (you created these when you installed MySQL, or you had them already) to create a new database called ``firefly-iii`` and a user ``firefly-iii``. Please give this user a strong password, and access to the database.

#### Download Firefly III
Go to the directory where you want to install Firefly III. Usually this is ``/var/www/html``. 

Once you're there, run the following command:

- ``git clone https://github.com/firefly-iii/firefly-iii.git``
   - Or variants of this command:
   - ``git clone https://github.com/firefly-iii/firefly-iii.git some-other-dir``
   - ``git clone https://github.com/firefly-iii/firefly-iii.git`` (defaults to ``firefly-iii``)

Please keep in mind that the web root of Firefly III is in the ``./public/`` directory, so you may need to update your web server configuration to match this later on.

#### Install packages
Enter the directory where all the code is. To install all necessary packages, run:

1. ``composer install --no-scripts --no-dev``

#### Configure Firefly III
Configure Firefly III by doing the following:

1. `cp .env.example .env`
2. ``php artisan key:generate``

Open ``firefly-iii/.env`` and check out the instructions below. Fields in the ``.env`` file that are not mentioned here should not be changed unless you know what they're for.

#### APP settings

* ``APP_DEBUG`` set this to true when you file a bug. It will enable detailed errors.
* ``APP_FORCE_SSL`` Firefly III knows if you use http or https. To force https, set this to true.
* ``APP_FORCE_ROOT`` Firefly III knows its own web address. If it is mistaken, fill in this field
* ``APP_LOG_LEVEL`` Change this to get more detailed logging.

#### DB settings

Change these settings to match your MySQL settings. Almost always, only the username, password and database need to be changed.

##### COOKIE settings

* ``COOKIE_PATH`` Tie the cookies to a specific path if necessary
* ``COOKIE_DOMAIN`` Tie the cookies to a specific domain
* ``COOKIE_SECURE`` Only use cookies over https

#### MAIL settings

These are important so pay attention. Use your GMail account or create an account at mailtrap.io. Firefly III uses these settings to mail error reports and detailed crash information if necessary. In the future, Firefly III will use these settings to mail you financial reports and stuff like that.

Whatever mail service you use, they can tell you what these settings are.

* ``MAIL_DRIVER`` Is usually smtp, but could be sendmail too.
* ``MAIL_HOST`` The (SMTP) host.
* ``MAIL_PORT`` The port, if relevant.
* ``MAIL_FROM`` The "from"-address
* ``MAIL_USERNAME`` The user name for the (SMTP) host.
* ``MAIL_PASSWORD`` The password.
* ``MAIL_ENCRYPTION`` If relevant. Usually TLS or SSL.

#### Other settings

* ``SEND_REGISTRATION_MAIL`` Send new users a email for their registration. Leave this on true, it's useful for your own registration.
* ``MUST_CONFIRM_ACCOUNT`` Is usually quite pointless for you so leave it to false.
* ``SHOW_INCOMPLETE_TRANSLATIONS`` Set this to true and you'll see all the weird languages Firefly III supports that are only half-translated.
* ``ANALYTICS_ID`` Put in a GA analytics ID if you want.
* ``SITE_OWNER`` Fill in your own email address.

Any other settings, such as in the ``config`` directory should not be changed.

#### Install the database

Run the following command to install the database:

* ``php artisan migrate --seed --env=production``

Answer YES to the questions.

#### Finish the installation

Finally, run the following command to finish the installation:

1. ``composer install --no-dev``

#### Visit Firefly III

Surf to your web server. The ``public/`` directory is your root. You may want to change your web server's configuration so you can surf to ``/`` and get Firefly.

You will see a Sign In screen. Use the Register pages to create a new account. After you've created a new account, you will get an introduction screen.

It may seem strange to register on your own website but there you are.

### Often seen errors

Please see the [installation guide FAQ](/installation-guide-faq/) for more information.
