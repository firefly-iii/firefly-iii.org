---
layout: page
title: Docker file
permalink: /installation-guide-docker/
---

Github users [@schoentoon](https://github.com/schoentoon), [@elohmeier](https://github.com/elohmeier) and [@crash7](https://github.com/crash7) have gracefully created a Dockerfile, which is included automatically with your Firefly III download.

The instructions below should help you set this up. Please realize that Docker is pretty advanced stuff.

First of all we need to boot up a container running the database, this can be done with a command that looks like the following.

```
docker run -d --name firefly-iii-db \
  -e MYSQL_DATABASE=firefly \
  -e MYSQL_USER=firefly \
  -e MYSQL_PASSWORD=firefly \
  -e MYSQL_RANDOM_ROOT_PASSWORD=yes \
  -v /data/:/var/lib/mysql \
  mysql:latest
```

This will create a MySQL database, data stored in /data/ on the host with a username 'firefly' and a password 'firefly'. More documentation
on this can be found over here https://hub.docker.com/_/mysql/

Next up we need to create our env configuration as always, as a database we need to specify 'db' as a hostname with the associcated username and password.

Then we create a container with the actual application, this can be done like the following. Make sure to modify the paths, imagename and db container name accordingly.

```
docker run -d --name firefly-iii \
  --link firefly-iii-db:db \
  -v /path/to/our/env/env:/var/www/firefly-iii/.env:ro \
  -v /path/to/our/storage:/var/www/firefly-iii/storage:rw \
  imagename
```

After doing this it won't work just yet as we haven't initialized the database yet. In order to do this we have to execute artisan inside the application container.

```
docker exec -ti firefly-iii php artisan migrate:refresh --seed
```

After this it should work, in case you're getting 500 errors the permissions of /path/to/our/storage are probably incorrect. The owner should be set to '33' aka the www-data user inside the firefly-iii container.