#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[31m"
N="\e[31m"

# condition:check for root user
if [ $USERID -ne 0 ]
then
    echo "Proceed with the root priveleges"
    exit 1
fi

#installing my Mysql server
dnf list installed mysql #first checking mysql wheather it already installed or not

if [ $? -ne 0 ]
then
    echo "Mysql is not installed. Going to install"
    dnf install mysql -y
    if [ $? -ne 0 ] 
    then
        echo "Mysql installation...FAILED"
        exit 1
    else
        echo "Mysql installation...SUCCESS"
    fi
else
    echo -e "$G Mysql is already Installed"
fi   


