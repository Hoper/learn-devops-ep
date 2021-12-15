#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install nmap apache2 -y
sudo shutdown -r now