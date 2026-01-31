#!/bin/bash
read -p "Enter a: " a
read -p "Enter b: " b
if [[ $a -gt $b ]];
then
	echo "a is greater than b."
elif [[ $b -gt $a ]];
then
	echo "b is greater than a."
else
	echo "Both are equal!!"
fi
	

