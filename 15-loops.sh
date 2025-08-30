#!/bin/bash

USERID=$(id -u)



# functins
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Proceed with ROOT priveleges"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2..FAILED"
    else
        echo "$2..SUCCESS"
    fi
}



# installing packages
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql not installed, Going to install it"
    dnf install mysql -y
    VALIDATE $? "installing mysql"
else
    echo "mysql is already installed"
fi

