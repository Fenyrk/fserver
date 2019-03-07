#!/bin/bash

source util/echo.sh

###########################
# Require root privileges #
###########################
function require_root() {
    if [[ $(id -u) -ne 0 ]]; then
        echo.error_b "Please run this script as root"
        exit 1
    fi
}

######################################
# Read a character from the keyboard #
######################################
function readKey() 
{
    if [[ -z $1 ]]; then
        echo.green_b "Press any key to continue..."
        read -n 1 -s
    else
        echo.green_b "$1"
        read -n 1 -s
    fi
}

function confirm() {
    local message=$1

    if [[ -z $message ]]; then
        message="Do you want to continue?"
    fi

    echo.info_b "$message [Y/n] "
    read

    case $REPLY in
        Y|y|yes) 
            echo "Continuar"
        ;;
        N|n|no) 
            echo.success_b "Abort."
            exit 1
        ;;
        *)
            echo.success_b "Abort."
            exit 1
        ;;
    esac
}

#################################
# Check the internet connection #
#################################
function check_connection() {
    echo.info_b "Checking internet connection... "
    ping -c 4 www.google.com &> /dev/null;
    if [[ $? -eq 0 ]]; then
        echo.success_b "Internet connection ..... [OK]"
        return 0
    else
        echo.error_b "There is no Internet connection ..... [FAILED]"
        return 1
    fi
}

#####################
# Update the system #
#####################
function update_system() {
    echo.info_b "Updating system..."
    sudo apt-get update > /dev/null;
    sudo apt-get upgrade -y > /dev/null;
    echo.success_b "System updated ..... [OK]"
}

###################################
# Check if a program is installed #
###################################
function is_installed() {
    echo.info_b "Checking if $1 is installed... "
    dpkg --get-selections $1 2> /dev/null | grep -o $1 > /dev/null

    if [[ $? -eq 0 ]]; then
        echo.success_b "The $1 package is already installed .... [OK]"
        return 0
    else
        echo.error_b "The $1 package is not installed ..... [OK]"
        return 1
    fi
}

###########################################
# Install a program from the repositories #
###########################################
function install_package() {
    local package=$1

    is_installed $package

    # If the package is not installed
    if [[ $? -eq 1 ]]; then
        check_connection

        if [[ $? -eq 0 ]]; then

            confirm
            update_system

            echo.info_b "Installing $package..."

            apt-get install $package -y > /dev/null;

            if [[ $? -eq 0 ]]; then 
                echo.success_b "$package installed successfully ..... [OK]"
                return 0
            else
                echo.error_b "$package not installed ..... [FAILED]"
                return 1
            fi
        fi
    fi
}

#######################
# Uninstall a program #
#######################
function uninstall_package() {
    local package=$1

    is_installed $package

    # If the package is installed
    if [[ $? -eq 0 ]]; then
        echo.info_b "Uninstalling $package..."

        apt-get remove --purge $package -y > /dev/null;

        if [[ $? -eq 0 ]]; then
            echo.success_b "$package uninstalled successfully ..... [OK]"
            return 0
        else
            echo.error_b "The $package package is not installed ..... [OK]"
            return 1
        fi
    fi
}