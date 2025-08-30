#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)

LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOG_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


# functins
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Proceed with ROOT priveleges" &>> $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2.. FAILED"
        echo "Script execution stopped due to above failure" &>> $LOG_FILE
        exit 1
    else
        echo -e "$2.. SUCCESS" &>> $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R Please pass the arguments along with script $N" &>> $LOG_FILE
}

# Checks for root access
CHECK_ROOT

# Checks for the arguments
if [ $# -eq 0 ]
then
    USAGE
fi

echo "Script started executing at:: $(date)"  &>> $LOG_FILE

# Lopps
# install the packages through arguments 
for package in $@  #$@ all the arguments passes through the script
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $? "installing $package" &>> $LOG_FILE
    else
        echo -e "$G $package is already installed $N" &>> $LOG_FILE
    fi
   
done