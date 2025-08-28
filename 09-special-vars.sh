#!/bin/bash

# special variables
echo "all variables passed through the script:: $@"
echo "number of variables/args passed:: $#"
echo "name of the script:: $0"
echo "current working directory:: $PWD"
echo "home directory of current user:: $HOME"
echo "PID of script executing now:: $$"
sleep 100 &
echo "PID of last background command:: $!"