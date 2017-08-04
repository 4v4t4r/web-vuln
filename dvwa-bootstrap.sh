#!/usr/bin/env bash
debconf-set-selections <<< 'mysql-server mysql-server/root_password password p@ssw0rd'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password p@ssw0rd'
<<<<<<< HEAD
echo -e "vagrant\nvagrant" | sudo passwd ubuntu
=======
>>>>>>> b41cf51209886e1fa0380a189f7b5a1918a9fc2c
apt-get update
apt-get install --yes mariadb-server mariadb-client
add-apt-repository -y ppa:nginx/stable
apt-get update
apt-get install --yes nginx
<<<<<<< HEAD
apt-get install --yes php-cli php-common php-mysql php-gd php-fpm php-cgi php-fpm php-pear php-mcrypt php-mbstring php-curl vim git
=======
apt-get install --yes php-cli php-common php-mysql php-gd php-fpm php-cgi php-fpm php-pear php-mcrypt vim git
>>>>>>> b41cf51209886e1fa0380a189f7b5a1918a9fc2c
apt-get -f install --yes
/etc/init.d/nginx stop
/etc/init.d/php7.0-fpm stop

sed -i 's/^;cgi.fix_pathinfo.*$/cgi.fix_pathinfo = 0/g' /etc/php/7.0/fpm/php.ini

## Settings for DVWA to be extra vuln :)
sed -i 's/allow_url_include = Off/allow_url_include = On/g' /etc/php/7.0/fpm/php.ini
sed -i 's/allow_url_fopen = Off/allow_url_fopen = On/g' /etc/php/7.0/fpm/php.ini
sed -i 's/safe_mode = On/safe_mode = Off/g' /etc/php/7.0/fpm/php.ini
echo "magic_quotes_gpc = Off" >> /etc/php/7.0/fpm/php.ini
sed -i 's/display_errors = Off/display_errors = On/g' /etc/php/7.0/fpm/php.ini

sed -i 's/^;security.limit_extensions.*$/security.limit_extensions = .php .php3 .php4 .php/g' /etc/php/7.0/fpm/pool.d/www.conf
sed -i 's/^;listen\s.*$/listen = \/var\/run\/\/php\/php7.0-fpm.sock/g' /etc/php/7.0/fpm/pool.d/www.conf
sed -i 's/^listen.owner.*$/listen.owner = www-data/g' /etc/php/7.0/fpm/pool.d/www.conf
sed -i 's/^listen.group.*$/listen.group = www-data/g' /etc/php/7.0/fpm/pool.d/www.conf
sed -i 's/^;listen.mode.*$/listen.mode = 0660/g' /etc/php/7.0/fpm/pool.d/www.conf
cat << 'EOF' > /etc/nginx/sites-enabled/default
server
{
    listen  80;
<<<<<<< HEAD
    root /var/www/dvwa;
=======
    root /var/www/html;
>>>>>>> b41cf51209886e1fa0380a189f7b5a1918a9fc2c
    index index.php index.html index.htm;
    #server_name localhost
    location "/"
    {
        index index.php index.html index.htm;
        #try_files $uri $uri/ =404;
    }

    location ~ \.php$
    {
        include /etc/nginx/fastcgi_params;
        fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $request_filename;
    }
}
EOF
/etc/init.d/mysql restart
/etc/init.d/php7.0-fpm restart
/etc/init.d/nginx restart
mysql -u root -p"p@ssw0rd" -e "CREATE DATABASE dvwa;"
mysql -u root -p"p@ssw0rd" -e "USE mysql; UPDATE user set plugin='' WHERE User='root'; FLUSH privileges;"
if [[ ! -d "/var/www/html" ]]; then mkdir -p /var/www; ln -s /usr/share/nginx/html /var/www/html; chown -R www-data. /var/www/html; fi
rm /var/www/html/*.html
<<<<<<< HEAD
cd /var/www/html && git clone https://github.com/RandomStorm/DVWA.git && chown -R www-data. ./ && mv ./DVWA/* . && rm -rf ./DVWA && chmod 777 ./hackable/uploads/; chmod 777 ./external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
cd /var/www && mv ./html ./dvwa && chown -R www-data. ./dvwa
cd /var/www/dvwa/config && cp /vagrant/resources/config.inc.php . && chown -R www-data. ./
=======
cd /var/www/html && git clone https://github.com/RandomStorm/DVWA.git && chown -R www-data. ./ && mv ./DVWA/* . && chmod 777 ./hackable/uploads/; chmod 777 ./external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
cd /var/www/html/config && cp /vagrant/resources/config.inc.php . && chown -R www-data. ./
>>>>>>> b41cf51209886e1fa0380a189f7b5a1918a9fc2c
