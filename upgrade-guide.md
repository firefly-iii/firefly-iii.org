---
layout: page
title: Upgrade guide
permalink: /upgrade-guide/
---

Firefly III has had a long and stormy history. Upgrading may prove to be difficult.

So far the most fool-proof way of upgrading I have found is installing Firefly III using a git checkout / composer update routine (see the [installation page](https://github.com/JC5/firefly-iii/wiki/Installation)).

Other methods (recommended by me in the past, mea culpa) will not allow you to update easily.

There are extra upgrade instructions [for upgrading to 3.7.0 on this page](https://github.com/JC5/firefly-iii/wiki/Upgrade-to-3.7.0).

There are also extra upgrade instructions [for upgrading to 3.10.0 on this page](https://github.com/JC5/firefly-iii/wiki/Upgrade-to-3.10).

## Upgrading

* Go to the ``firefly-iii`` folder.
* Run ``git pull``
* Run ``rm -rf bootstrap/cache/*``
* Run ``php artisan migrate --env=production``

That should do it!

### Alternative

* Go to the ``firefly-iii`` folder.
* Run ``git pull``
* RUN ``rm -rf bootstrap/cache/*``
* Run ``rm -rf vendor/``
* Run ``composer install --no-scripts --no-dev``
* Run ``composer install --no-dev``
* Run ``php artisan migrate --env=production``