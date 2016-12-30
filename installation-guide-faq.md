---
layout: page
title: Installation guide FAQ
permalink: /installation-guide-faq/
---

## Installation errors

Some common errors:

### 404 when trying to visit login page

Run `sudo a2enmod rewrite`.	Check if the database credentials in de `.env` file are correct. Make sure the directory where Firefly III installed has `AllowOverride All` in the Apache config. Restart Apache.

### 500 errors, logs are empty

If the logs are empty (``storage/logs``) Firefly can't write to them. See above for the commands. If the logs still remain empty, do you have a the ``vendor`` in your Firefly root? If not, run the Composer commands.

### Unexpected question mark

```
PHP Parse error:  syntax error, unexpected '?' in 
app/Support/Twig/General.php on line 103
```

Firefly III requires PHP 7 or higher.

### BCMath

```
PHP message: PHP Fatal error: Call to undefined function 
FireflyIII\Http\Controllers\bcscale() in
firefly-iii/app/Http/Controllers/HomeController.php on line 76
```

Solution: you haven't enabled or installed the BCMath module.

### intl

Errors such as these:

```
production.ERROR: exception 
'Symfony\Component\Debug\Exception\FatalErrorException' with message
'Call to undefined function FireflyIII\Http\Controllers\numfmt_create()'
in firefly-iii/app/Http/Controllers/Controller.php:55
```

Solution: You haven't enabled or installed the Internationalization extension.

If you are running FreeBSD, install ``pecl-intl``.

### Cannot find /login or other URL's

Make sure your Apache and/or nginx configuration is correct.