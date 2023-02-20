#!/bin/bash

clear
banner="#####################################################################################################################

  ____  _           
 |  _ \(_) ___ ___  
 | |_) | |/ __/ _ \ 
 |  _ <| | (_| (_) |
 |_| \_\_|\___\___/ 
                                                                                            Fiture All Repository !!!       
#####################################################################################################################"

echo "$banner"
sleep 2
# Update the package list and install Apache2, PHP, PHP MySQLi, Git, and MariaDB
apt-get install apache2 unzip php php-mysqli php-mysql git mariadb-server -y
# Start Apache2 service
service apache2 start


# Clone the web-dinamis-produktif repository to /var/www/
cd /var/www/ && git clone https://github.com/iniciloo/absensi.git

# Give permission to access asset directory and index.php file
chmod 777 -R /var/www/

# Replace the default Apache2 configuration with the custom configuration
cd /etc/apache2/sites-available/
rm -r /etc/apache2/sites-available/000-default.conf
cp /var/www/absensi/assets/shell/000-default.conf .
rm ../sites-enabled/000-default.conf
cp 000-default.conf ../sites-enabled/
cd ../../../

# Restart Apache2 service
systemctl restart apache2

# Get RDS endpoint address
clear
echo "$banner"
sleep 2
echo "Masukkan RDS endpoint anda: "
read rds_endpoint
echo "Masukkan username RDS anda: "
read username_rds
echo "Masukkan Password RDS anda: "
read password_rds

# Modify the file koneksi.php to use the RDS database
sed -i "s/localhost/$rds_endpoint/g" /var/www/absensi/config/db.php
sed -i "s/root/$username_rds/g" /var/www/absensi/config/db.php
sed -i "s/\"\"/\"$password_rds\"/g" /var/www/absensi/config/db.php
sed -i "s/db/absensi/g" /var/www/absensi/config/db.php

# Check if the modification was successful
if [ $? -eq 0 ]; then
  echo "File koneksi.php has been successfully modified."
else
  echo "Failed to modify the file koneksi.php."
fi
echo "Masukkan password RDS anda"
sleep 2
# Login to the RDS database
mysql -h $rds_endpoint -u $username_rds -p <<EOF

# Show existing databases
show databases;

# Create the absensi database
create database absensi;

# Use the absensi database
use absensi;

# Import the SQL script to create tables and populate data
source /var/www/absensi/database/db_rico.sql

# Show tables in the absensi database
show tables;

# Exit the MySQL prompt
EOF

# Restart apache2 service
service apache2 restart

sudo apt install xfsprogs -y
sudo mkfs -t xfs /dev/xvdb
sudo mkdir /ebs-ubuntu
sudo mount /dev/xvdb /ebs-ubuntu
sudo nano /ebs-ubuntu/ubuntu.txt

sudo mkdir /mnt/efs/fs1/ubuntu
cd /mnt/efs/fs1/

sudo rsync -avR --stats /var/www/absensi /ebs-ubuntu