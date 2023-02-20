#!/bin/bash
apt-get update -y
apt-get update -y
chmod +x -R asset/
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

PS3='Please enter your choice: '
options=("Install Web Static" "Install Web Dinamis" "Auto Mount EBS" "Quit")
select opt in "${options[@]}"; do
    case $opt in
    "Install Web Static")
        sudo ./asset/WebStatis/webstatis.sh
        ;;

    "Install Web Dinamis")
         sudo ./asset/WebDinamis/webdinamis.sh
        ;;

    "Auto Mount EBS")
        sudo ./asset/AutoMountEBS/mountEBS.sh
        ;;

    "Quit")
        break
        ;;
    *) echo invalid option ;;
    esac
done
