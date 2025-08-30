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
        echo "Script execution stopped due to above failure"
        exit 1
    else
        echo "$2..SUCCESS"
    fi
}

USAGE(){
    if [ $? -eq 0 ]
    then
        echo "Please pass the arguments along with script "
    fi
}

# Checks for root access
CHECK_ROOT

# Lopps
# install the packages through arguments 
for package in $@  #$@ all the arguments passes through the script
do
    dnf list installed $package
    dnf install $package -y
    VALIDATE $? "installing $package"
done

USAGE


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

