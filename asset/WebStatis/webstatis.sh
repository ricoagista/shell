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
statis=("company-profile-faris" "company-profile-niar" "company-profile-rico" "company-profile-sefina" "Quit")
echo "Pilih Apps Yang ingin anda gunakan :"
select statis in "${statis[@]}"; do
    case $statis in
    "company-profile-faris")
        ./asset/WebStatis/faris/faris.sh
        echo "check apakah aplikasi sudah terinstall dengan benar ?"
        pil2=("Yes" "No")
        echo "Pilih Apps Yang ingin anda gunakan :"
        select pil2 in "${pil2[@]}"; do
            case $pil2 in
            "Yes")
                echo "Terimakasih atas kepercayaan anda"
                break
                ;;
            "No")
                echo "Mohon Maaf atas ketidak nyamanan dari pelayanan kami...."
                echo "Silahkan Hubungi Developer melalui github."
                break
                ;;
            esac
        done
        ;;
    "company-profile-niar")
        ./asset/WebStatis/niar/niar.sh
        echo "check apakah aplikasi sudah terinstall dengan benar ?"
        pil1=("Yes" "No")
        echo "Pilih Apps Yang ingin anda gunakan :"
        select pil1 in "${pil1[@]}"; do
            case $pil1 in
            "Yes")
                echo "Terimakasih atas kepercayaan anda"
                break
                ;;
            "No")
                echo "Mohon Maaf atas ketidak nyamanan dari pelayanan kami...."
                echo "Silahkan Hubungi Developer melalui github."
                break
                ;;
            esac
        done
        ;;
    "company-profile-rico")
        ./asset/WebStatis/rico/rico.sh
        echo "check apakah aplikasi sudah terinstall dengan benar ?"
        pil=("Yes" "No")
        echo "Pilih Apps Yang ingin anda gunakan :"
        select pil in "${pil[@]}"; do
            case $pil in
            "Yes")
                echo "Terimakasih atas kepercayaan anda"
                break
                ;;
            "No")
                echo "Mohon Maaf atas ketidak nyamanan dari pelayanan kami...."
                echo "Silahkan Hubungi Developer melalui github."
                break
                ;;
            esac
        done
        ;;
"company-profile-sefina")
        ./asset/WebStatis/sefina/sefina.sh
        echo "check apakah aplikasi sudah terinstall dengan benar ?"
        pil1=("Yes" "No")
        echo "Pilih Apps Yang ingin anda gunakan :"
        select pil1 in "${pil1[@]}"; do
            case $pil1 in
            "Yes")
                echo "Terimakasih atas kepercayaan anda"
                break
                ;;
            "No")
                echo "Mohon Maaf atas ketidak nyamanan dari pelayanan kami...."
                echo "Silahkan Hubungi Developer melalui github."
                break
                ;;
            esac
        done
        ;;
    "Quit")
        break
        ;;
    esac
done
