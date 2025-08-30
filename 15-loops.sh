#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Proceed with ROOT priveleges"
fi
