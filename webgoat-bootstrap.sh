#!/usr/bin/env bash

# Docker Installation
cd ~
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce
usermod -aG docker ${USER}
#docker pull webgoat/webgoat-8.0
#docker run -p 9090:8080 --detach --restart unless-stopped webgoat/webgoat-8.0
docker pull webgoat/webgoat-7.1
docker run -p 8080:8080 --detach --restart unless-stopped webgoat/webgoat-7.1

## More instructions found at https://github.com/WebGoat/WebGoat/
#cd ~
#apt-get install --yes --quiet build-essential autotools-dev automake pkg-config expect default-jdk maven
#git clone -b master https://github.com/WebGoat/WebGoat.git
#git clone -b master https://github.com/WebGoat/WebGoat-Lessons.git
#mvn -q -DskipTests -file WebGoat/pom.xml clean compile install
#mvn -q -DskipTests -file WebGoat-Lessons/pom.xml package
#cp -fa ./WebGoat-Lessons/target/plugins/*.jar ./WebGoat/webgoat-container/src/main/webapp/plugin_lessons/

#cd ./WebGoat && git checkout develop && mvn clean install

#cd /etc/nginx/sites-available && cp ./default ./tmp && echo -e "\n" >> ./default
#sed -i 's/80/8088/g' /etc/nginx/sites-available/tmp
#sed -i 's/dvwa/mutillidae/g' /etc/nginx/sites-available/tmp
#cd /etc/nginx/sites-available && cat ./tmp >> ./default && rm ./tmp
#/etc/init.d/nginx restart
#mysql -u root -e "CREATE DATABASE mutillidae;"
#if [[ ! -d "/var/www/mutillidae" ]]; then mkdir -p /var/www/mutillidae; chown -R www-data. /var/www/mutillidae; fi
#cd /var/www/mutillidae && git clone git://git.code.sf.net/p/mutillidae/git && chown -R www-data. ./ && cp -r git/* . && rm -rf git
