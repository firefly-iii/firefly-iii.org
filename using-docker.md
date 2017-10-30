---
layout: page
title: Docker
redirect_from:
  - /installation-guide-docker/
---
Github users [@schoentoon](https://github.com/schoentoon), [@elohmeier](https://github.com/elohmeier), [@patrickkostjens](https://github.com/patrickkostjens), [@crash7](https://github.com/crash7), [@jleeong](https://github.com/jleeong) and various others have gracefully contributed to a Dockerfile, which is included automatically with your Firefly III download.

The instructions below should help you set this up. Please realize that Docker is pretty advanced stuff.

### Docker Hub With Automatic Updates Via Docker-Compose

1. Copy our file located [here](https://github.com/firefly-iii/firefly-iii/blob/master/docker-compose.dockerhub.yaml)

2. Modify the following variables.
 * MYSQL_PASSWORD
 * FF_DB_PASSWORD
 * FF_APP_KEY

 `NOTE: MYSQL_PASSWORD and FF_DB_PASSWORD need to be identical.`

3. OPTIONAL: Ports If you would like to specify a diffrent port modify the ports line. Ports are specified in the format of host:container if you want firefly-iii exposed on port 9001 it would be "9001:80" if you would rather it be on 443 it would be "443:80"

4. Start up the container 
`docker-compose -f docker-compose.dockerhub.yaml up -d`

5. Proceed to the "init-database" step below if this is the first time running firefly-iii.

6. After the database is initialized you may navigate to your http://dockerhostaddress:9001 or whatever port you chose and firefly-iii will be running.

To update the container just run
```
docker-compose restart firefly-app
```


### Docker Hub With Automatic Updates Via Run/Pull

```
To Be Added Soon
```

### For production

Run this command:

`docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d`

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

Run the following commands:

```
docker-compose exec firefly-app php artisan migrate --seed
docker-compose exec firefly-app php artisan firefly:upgrade-database
docker-compose exec firefly-app php artisan firefly:verify
```
