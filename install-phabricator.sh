#!/bin/bash

# modified script at http://www.phabricator.com/rsrc/install/install_ubuntu.sh

mkdir /opt/phabricator
cd /opt/phabricator

sudo apt-get -qq update

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password ohana'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password ohana'
sudo apt-get -y install mysql-server

sudo apt-get -y install \
  git apache2 dpkg-dev \
  php5 php5-mysql php5-gd php5-dev php5-curl php-apc php5-cli php5-json

sudo apt-get -y install emacs

sudo a2enmod rewrite

apt-get source php5
PHP5=`ls -1F | grep '^php5-.*/$'`
(cd $PHP5/ext/pcntl && phpize && ./configure && make && sudo make install)

git clone git://github.com/facebook/libphutil.git
git clone git://github.com/facebook/arcanist.git
git clone git://github.com/facebook/phabricator.git

cd -

sudo cp -f /vagrant/httpd.conf /etc/apache2/httpd.conf
sudo chown root:root /etc/apache2/httpd.conf
sudo chmod 644 /etc/apache2/httpd.conf

sudo sed -i 's/^;date.timezone =/date.timezone = America\/Los_Angeles/' /etc/php5/apache2/php.ini

sudo service apache2 restart

sudo service ufw stop

sudo /opt/phabricator/phabricator/bin/config set mysql.user root
sudo /opt/phabricator/phabricator/bin/config set mysql.pass ohana
sudo /opt/phabricator/phabricator/bin/storage upgrade --force

sudo /opt/phabricator/phabricator/bin/config set phabricator.base-uri 'http://phabricator-p4.ohana:8080/'

sudo /opt/phabricator/phabricator/bin/phd start

sudo chown -R vagrant:vagrant /opt/phabricator

sudo sed -i '/.*skip-external.*/asql-mode=STRICT_ALL_TABLES' /etc/mysql/my.cnf
sudo service mysql restart
