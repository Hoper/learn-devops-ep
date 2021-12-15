#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y install tasksel
sudo tasksel install lamp-server
wget https://wordpress.org/latest.tar.gz -O /tmp/wp-install.zip
sudo tar -xzf /tmp/wp-install.zip --directory /var/www/
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo cp /tmp/wp.conf /etc/apache2/sites-available/wp.conf
sudo ln -s /etc/apache2/sites-available/wp.conf /etc/apache2/sites-enabled/wp.conf
sudo systemctl restart apache2.service