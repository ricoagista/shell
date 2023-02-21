#!/bin/bash

apt update -y
apt upgrade -y
apt install git -y
apt install rsync -y
apt-get install apache2 -y
service apache2 start
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

# Clone the company-sefina repository to /var/www/html
cd /var/www/html/ && git clone https://github.com/iniciloo/company-rico.git

# Give permission to access asset directory and index.php file
chmod 777 -R /var/www/html/company-rico/

# Replace the default Apache2 configuration with the custom configuration
cd /etc/apache2/sites-available/
rm -r /etc/apache2/sites-available/000-default.conf
cp /var/www/html/company-rico/shell/000-default.conf .
rm ../sites-enabled/000-default.conf
cp 000-default.conf ../sites-enabled/
cd ../../../

# Restart Apache2 service
systemctl restart apache2

sudo apt install xfsprogs -y
sudo mkfs -t xfs /dev/xvdb
sudo mkdir /ebs-debian
sudo mount /dev/xvdb /ebs-debian
sudo nano /ebs-debian/debian.txt

sudo mkdir /mnt/efs/fs1/debian
cd /mnt/efs/fs1/

sudo rsync -avR --stats /var/www/html/company-rico /ebs-debian

sudo rsync -avR --stats /var/log /mnt/efs/fs1/
