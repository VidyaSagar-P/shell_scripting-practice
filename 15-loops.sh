#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Proceed with ROOT priveleges"
    exit 1
fi

# installing packages
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql not installed, Going to install it"
    dnf install mysqls -y
    if [ $? -ne 0 ]
    then
        echo "there is an error installing mysql, please check the script"
        exit 1
    else
        echo "mysql installation..SUCCESS"
    fi
else
    echo "mysql is already installed"
fi

