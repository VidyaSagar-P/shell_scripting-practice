#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then 
    echo "Proceed with root priveleges"
    exit 1
fi

#function
VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo "$2 is FAILED"
    else
        echo "$2 IS SUCCESS"
    fi
}

#Mysql installation
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql not installed, Going to install now"
    dnf install mysql -y
    VALIDATE $? "Mysql installing"
    
else
    echo "mysql already installed"
fi