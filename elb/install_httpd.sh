#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo echo "<h1>DevOps World</h1>" | sudo tee /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd
