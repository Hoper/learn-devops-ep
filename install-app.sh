#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt -y install tasksel
sudo tasksel install lamp-server
sudo shutdown -r now