#!/bin/bash

USERID=$(id -u)


# condition:check for root user
if [ $USERID -ne 0 ]
then
    echo "Proceed with the root priveleges"
fi