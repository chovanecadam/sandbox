#!/bin/sh

while getopts hd o
do
    case "$o" in
        h) halt=1;;
        d) destroy=1;;
        *) echo "$0 [-d|-h] [vm name]" && exit 1;;
    esac
done
shift $((OPTIND-1))

if [ ! -z $destroy ]
    then vagrant destroy $1 -f | tee logs/reset.log
    exit 0
fi

if [ ! -z $halt ] 
    then vagrant halt $1 -f | tee logs/reset.log
    exit 0
fi

(vagrant destroy $1 -f; vagrant up $1) | tee logs/reset.log
exit 0
