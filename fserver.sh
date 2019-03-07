#!/bin/bash

source util/echo.sh
source util/system.sh

require_root

trap '' 2 # You can't use Ctrl+C to terminate the process

# Servers
declare -a DNS_SERVER=("bind9" "DNS Server")
declare -a WEB_SERVER=("apache2" "WEB Server")
declare -a DHCP_SERVER=("isc-dhcp-server" "DHCP Server")
declare -a FTP_SERVER=("vsftpd" "FTP Server")
declare -a SSH_SERVER=("openssh-server" "SSH Server")

# Console text color
declare -A COLOR
COLOR[BLACK]="\e[1;30"
COLOR[RED]="\e[0m\e[1;31m" 
COLOR[GREEN]="\e[0m\e[1;32m" 
COLOR[YELLOW]="\e[0m\e[1;33m"
COLOR[BLUE]="\e[0m\e[1;34m"
COLOR[PURPLE]="\e[0m\e[1;35m"
COLOR[CYAN]="\e[0m\e[1;36m"
COLOR[WHITE]="\e[0m\e[1;37m"
COLOR[END]="\e[0m"

# Header about
function header() {
    clear
    echo.success_b "   _____                               _  __    ___  _  _   ";
    echo.success_b "  |  ___|__  ___ _ ____   _____ _ __  / |/ /_  / _ \| || |  ";
    echo.success_b "  | |_ / __|/ _ \ '__\ \ / / _ \ '__| | | '_ \| | | | || |_ ";
    echo.success_b "  |  _|\__ \  __/ |   \ V /  __/ |    | | (_) | |_| |__   _|";
    echo.success_b "  |_|  |___/\___|_|    \_/ \___|_|    |_|\___(_)___/   |_|  ";
    echo.success_b "                                                            ";
    echo.success_b "             +-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+              ";
    echo.success_b "             |D|e|v|e|l|o|p| |b|y| |F|e|n|y|r|              ";
    echo.success_b "             +-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+              ";
    # echo.info_b "File name: $0"
}

function dns_conf() {
    while [[ "$REPLY" != 0 ]]; do
        clear
        header
        echo -e ${COLOR[YELLOW]}"-- $server_name options --";
        echo 
        echo "  1. Backup files";
        echo "  2. Return";
        echo "  0. Exit";
        echo
        read -p "What do you want to do? " -n 1
        echo -e 

        case $REPLY in
            0)
                echo -e ${COLOR[GREEN]}"Done"
            ;;
            1)
                if [ -d "/etc/bind/" ] 
                then
                    echo "Directory exist"
                fi
                readKey
            ;;
            2)
                break
            ;;

            *)
                echo -e ${COLOR[RED]}"Invalid option"
                readKey
            ;;
        esac
        
    done
}

function server_conf() {

    declare -a SERVER=("${!1}")
    local server_package=${SERVER[0]}
    local server_name=${SERVER[1]}

    while [[ "$REPLY" != 0 ]]; do
        clear
        header
        echo -e ${COLOR[YELLOW]}"-- $server_name options --";
        echo 
        echo "  1. Check if it is installed";
        echo "  2. Install";
        echo "  3. Uninstall";
        echo "  4. Setup";
        echo "  5. Return";
        echo "  0. Exit";
        echo
        read -p "What do you want to do? " -n 1
        echo -e 

        case $REPLY in
            0)
                echo.success_b "Done"
            ;;
            1) 
                is_installed $server_package
                readKey
            ;;
            2)
                install_package $server_package
                readKey
            ;;
            3)
                uninstall_package $server_package
                readKey
            ;;
            4)
                case $server_package in
                    bind9) 
                        echo "Setup $server_name"
                        dns_conf
                    ;;
                esac
            ;;
            5)
                break
            ;;
            *) 
                echo.error_b "Invalid option"
                readKey
            ;;
        esac
    done
}

while [[ "$REPLY" != 0 ]]; do
    header
    echo -e ${COLOR[YELLOW]}"-- Main menu --"
    echo
    echo "This script will help you install and configure the following servers quickly:";
    echo
    echo "  1. ${DNS_SERVER[1]}";
    echo "  2. ${WEB_SERVER[1]}";
    echo "  3. ${DHCP_SERVER[1]}";
    echo "  4. ${FTP_SERVER[1]}";
    echo "  5. ${SSH_SERVER[1]}";
    echo "  0. Exit";
    echo
    read -p "Choose an option > " -n 1
    echo -e 

    case $REPLY in
        0)
            echo -e ${COLOR[GREEN]}"Program terminated .... [OK]"
        ;;
        1)
            server_conf DNS_SERVER[@]
        ;;
        2)
            server_conf WEB_SERVER[@]
        ;;
        3)
            server_conf DHCP_SERVER[@]
        ;;
        4)
            server_conf FTP_SERVER[@]
        ;;
        5)
            server_conf SSH_SERVER[@]
        ;;
        *)
            echo -e ${COLOR[RED]}"Invalid option"
            readKey "Presiona una tecla para continuar..."
        ;;
    esac

done