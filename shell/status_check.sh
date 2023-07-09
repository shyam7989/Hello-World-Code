#!/bin/bash

pid=`ps -ef | grep -v grep | grep -i httpd | wc -l`

if [ $pid -eq 5 ];
then 
  echo  "Httpd service is running"
else
  echo  "Httpd service is not running"
  echo " Starting httpd service now"
  systemctl restart httpd
  echo "httpd service started now"
fi
