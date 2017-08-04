#!/usr/bin/env bash
<<<<<<< HEAD


## More instructions found at https://sourceforge.net/projects/mutillidae/files/documentation/ (08/03/2017)

cd /etc/nginx/sites-available && cp ./default ./tmp && echo -e "\n" >> ./default
sed -i 's/80/8088/g' /etc/nginx/sites-available/tmp
sed -i 's/dvwa/mutillidae/g' /etc/nginx/sites-available/tmp
cd /etc/nginx/sites-available && cat ./tmp >> ./default && rm ./tmp
/etc/init.d/nginx restart
mysql -u root -e "CREATE DATABASE mutillidae;"
if [[ ! -d "/var/www/mutillidae" ]]; then mkdir -p /var/www/mutillidae; chown -R www-data. /var/www/mutillidae; fi
cd /var/www/mutillidae && git clone git://git.code.sf.net/p/mutillidae/git && chown -R www-data. ./ && cp -r git/* . && rm -rf git
=======
apt-get install --yes apache2 apache2-utils php-pear php-mcrypt php-gd php-curl
/etc/init.d/apache2 stop

## Change default listen port to 88
sed -i 's/Listen 80/Listen 88/' /etc/apache2/ports.conf

## Instructions from https://sourceforge.net/projects/mutillidae/files/documentation/
sed -i 's/DirectoryIndex index.html.*$/DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/' /etc/apache2/mods-available/dir.conf
cd /etc/apache2/mods-enabled && ln -s ../mods-available/dir.conf dir.conf
/etc/init.d/mysql restart
/etc/init.d/php7.0-fpm restart
/etc/init.d/apache2 restart
mysql -u root -p"p@ssw0rd" -e "CREATE DATABASE mutillidae;"
if [[ ! -d "/var/www/html" ]]; then mkdir -p /var/www; ln -s /usr/share/nginx/html /var/www/html; chown -R www-data. /var/www/html; fi
cd /var/www/ && git clone git://git.code.sf.net/p/mutillidae/git mutillidae && chown -R www-data. ./mutillidae && chmod 777 ./mutillidae
>>>>>>> b41cf51209886e1fa0380a189f7b5a1918a9fc2c
