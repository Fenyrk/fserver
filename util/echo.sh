#!/bin/bash

##########################
# messages prompt colors #
##########################

# echo with green prompt color
function echo.success () {
    echo -e "\e[0;32m$1\e[0m"
}

# echo with green prompt color (bold)
function echo.success_b () {
    echo -e "\e[1;32m$1\e[0m"
}

# echo with green prompt color (background)
function echo.success_bg () {
    echo -e "\e[42m$1\e[0m"
}

# echo with yellow prompt color
function echo.warning () {
    echo -e "\e[0;33m$1\e[0m"
}

# echo with yellow prompt color (bold)
function echo.warning_b () {
    echo -e "\e[1;33m$1\e[0m"
}

# echo with yellow prompt color (background)
function echo.warning_bg () {
    echo -e "\e[43m$1\e[0m"
}

# echo with red prompt color
function echo.error () {
    echo -e "\e[0;31m$1\e[0m"
}

# echo with red prompt color (bold)
function echo.error_b () {
    echo -e "\e[1;31m$1\e[0m"
}

# echo with red prompt color (background)
function echo.error_bg () {
    echo -e "\e[41m$1\e[0m"
}

# echo with blue prompt color
function echo.info () {
    echo -e "\e[0;34m$1\e[0m"
}

# echo with blue prompt color (bold)
function echo.info_b () {
    echo -e "\e[1;34m$1\e[0m"
}

# echo with blue prompt color (background)
function echo.info_bg () {
    echo -e "\e[44m$1\e[0m"
}

#########################
# Regular prompt colors #
#########################

# echo with black prompt color
function echo.black () {
    echo -e "\e[0;30m$1\e[0m"
}

# echo with red prompt color
function echo.red () {
    echo -e "\e[0;31m$1\e[0m"
}

# echo with green prompt color
function echo.green () {
    echo -e "\e[0;32m$1\e[0m"
}

# echo with yellow prompt color
function echo.yellow () {
    echo -e "\e[0;33m$1\e[0m"
}

# echo with blue prompt color
function echo.blue () {
    echo -e "\e[0;34m$1\e[0m"
}

# echo with purple prompt color
function echo.purple () {
    echo -e "\e[0;35m$1\e[0m"
}

# echo with cyan prompt color
function echo.cyan () {
    echo -e "\e[0;36m$1\e[0m"
}

# echo with white prompt color
function echo.white () {
    echo -e "\e[0;37m$1\e[0m"
}

######################
# Bold prompt colors #
######################

# echo with black prompt color (bold)
function echo.black_b () {
    echo -e "\e[1;30m$1\e[0m"
}

# echo with red prompt color (bold)
function echo.red_b () {
    echo -e "\e[1;31m$1\e[0m"
}

# echo with green prompt color (bold)
function echo.green_b () {
    echo -e "\e[1;32m$1\e[0m"
}

# echo with yellow prompt color (bold)
function echo.yellow_b () {
    echo -e "\e[1;33m$1\e[0m"
}

# echo with blue prompt color (bold)
function echo.blue_b () {
    echo -e "\e[1;34m$1\e[0m"
}

# echo with purple prompt color (bold)
function echo.purple_b () {
    echo -e "\e[1;35m$1\e[0m"
}

# echo with cyan prompt color (bold)
function echo.cyan_b () {
    echo -e "\e[1;36m$1\e[0m"
}

# echo with white prompt color (bold)
function echo.white_b () {
    echo -e "\e[1;37m$1\e[0m"
}

############################
# Background prompt colors #
############################

# echo with black prompt color (background)
function echo.black_bg () {
    echo -e "\e[40m$1\e[0m"
}

# echo with red prompt color (background)
function echo.red_bg () {
    echo -e "\e[41m$1\e[0m"
}

# echo with green prompt color (background)
function echo.green_bg () {
    echo -e "\e[42m$1\e[0m"
}

# echo with yellow prompt color (background)
function echo.yellow_bg () {
    echo -e "\e[43m$1\e[0m"
}

# echo with blue prompt color (background)
function echo.blue_bg () {
    echo -e "\e[44m$1\e[0m"
}

# echo with purple prompt color (background)
function echo.purple_bg () {
    echo -e "\e[45m$1\e[0m"
}

# echo with cyan prompt color (background)
function echo.cyan_bg () {
    echo -e "\e[46m$1\e[0m"
}

# echo with white prompt color (background)
function echo.white_bg () {
    echo -e "\e[47m$1\e[0m"
}