#!/bin/sh

resetc="\e[0m"
for tcolor in {30..37}; do
	printf "\e[${tcolor}m████"
done
printf "${resetc}\n"
for tcolor in {90..97}; do
	printf "\e[${tcolor}m████"
done
printf "${resetc}\n"
