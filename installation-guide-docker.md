---
layout: page
title: Docker file
permalink: /installation-guide-docker/
---

Github users [@schoentoon](https://github.com/schoentoon), [@elohmeier](https://github.com/elohmeier), [@patrickkostjens](https://github.com/patrickkostjens) and [@crash7](https://github.com/crash7) have gracefully created a Dockerfile, which is included automatically with your Firefly III download.

The instructions below should help you set this up. Please realize that Docker is pretty advanced stuff.

### For production (this means you)

Run this command:

`docker-compose -f docker-compose.yml -f docker-compose.prod.yml up`

Then run the "init-database" task (see the tasks below).



### For development

Run the following command:

`docker-compose up`

It will use docker-compose.yml and pull docker-compose.override.yml automatically

Then, run the "composer-install" and "init-database" (see the tasks below).

### Tasks

#### composer-install

Run the following command:

`docker-compose exec firefly-app composer install`

#### init-database

Run the following command:

`docker-compose exec firefly-app php artisan migrate:refresh --seed`
