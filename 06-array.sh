#!/bin/bash

# INDEX START FROM 0, AND SIZE 4
FRUITS=("Banana" "Mango" "Apple" "Grapes")

echo "first fruit is:: ${FRUITS[0]}"
echo "second fruit is:: ${FRUITS[1]}"
echo "third fruit is:: ${FRUITS[2]}"
echo "fourth fruit is:: ${FRUITS[3]}"

echo "all fruits:: ${FRUITS[@]}"