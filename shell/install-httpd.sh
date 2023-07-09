#!/bin/bash
yum update -y
yum install httpd -y
echo " Test application " > /var/www/html/index.html
echo " Launch httpd server " >> /var/www/html/index.html
systemctl start httpd

