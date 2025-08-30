#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


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
        echo "Script execution stopped due to above failure"
        exit 1
    else
        echo -e "$Y $2..SUCCESS $N"
    fi
}

USAGE(){
    echo -e "$R Please pass the arguments along with script $N "
}

# Checks for root access
CHECK_ROOT

# Checks for the arguments
if [ $# -eq 0 ]
then
    USAGE
fi

# Lopps
# install the packages through arguments 
for package in $@  #$@ all the arguments passes through the script
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        dnf install $package -y
        VALIDATE $? "installing $package"
    else
        echo -e "$G $package is already installed $N"
    fi
   
done




# installing packages
#mysql installation
# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "mysql not installed, Going to install it"
#     dnf install mysql -y
#     VALIDATE $? "installing mysql"
# else
#     echo "mysql is already installed"
# fi

# #nginx installation
# dnf list installed nginx

# if [ $? -ne 0 ]
# then
#     echo "nginx not installed, Going to install it"
#     dnf install nginx -y
#     VALIDATE $? "installing nginx"
# else
#     echo "nginx is already installed"
# fi

