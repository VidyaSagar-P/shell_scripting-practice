#!/bin/bash

# if else condition
# -gt(grater than), -lt(less than), -eq(equals to), -ne(not equals), -ge(greater than or euqals),
# -le(less than or equals)

NUMBER=$1

if [ $NUMBER -gt 20 ]
then
    echo "given number $NUMBER is greater than 20"
else
    echo "given number $NUMBER is less than 20"
fi