## 1. Prepare and upgrade your server.

Please pick either Ubuntu or CentOS below.

## 1b. CentOS

To install the necessary PHP7 packages on CentOS, you can run the following code:

For the latest PHP7 version: 

```
rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
```

Install the programs needed:
```
yum install apache mysql mysql-server php70w php70w-mbstring php70w-mcrypt php70w-bcmath php70w-gd php70w-intl php70w-pdo php70w-xml php70w-mysql.x86_64
```

Install composer

```
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
```
