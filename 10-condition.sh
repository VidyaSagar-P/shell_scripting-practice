#!/bin/bash

# if else condition
# -gt(grater than), -lt(less than), -eq(equals to), -ne(not equals), -ge(greater than or euqals),
# -le(less than or equals)

NUMBER1=$1
NUMBER2=$2

if [ $NUMBER1 -gt 20 ]
then
    echo "given number $NUMBER1 is greater than 20"
else
    echo "given number $NUMBER1 is less than 20"
fi

if [ $NUMBER2 -eq 20 ]
then
    echo "condition satisfied"
else
    echo "condition not satisfied"
fi