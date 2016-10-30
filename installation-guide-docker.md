---
layout: page
title: Docker file
permalink: /installation-guide-docker/
---

Github user @schoentoon has gracefully created a Dockerfile, which is included automatically with your Firefly III download.

To run this, use a run command that looks something like this

``docker run --name firefly-iii --link firefly-iii-db:db -v /data/firefly-iii/env:/var/www/firefly-iii/.env:ro firefly-iii``

This does assume there is a database with data already present, if not you'll have to run something like this first

``docker run --rm -it --link firefly-iii-db:db -v /data/firefly-iii/env:/var/www/firefly-iii/.env:ro firefly-iii php artisan migrate --seed --env=production``
