#!/bin/bash

while getopts srb: o
do
    case "$o" in
        s) save=1;;
        b) box=$OPTARG;;
        *) echo "Usage: $0 [-s] [-b NAME] [SNAPSHOT NAME]" && exit 1;;
    esac
done
shift $((OPTIND-1))

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

SNAPSHOT=${1:-DEFAULT}
ARGS=${@:2}

if [ ! -z $save ]; 
then 
    if [ -z $box ]; 
    then 
        vagrant snapshot save eve $SNAPSHOT
        vagrant snapshot save alice $SNAPSHOT
        vagrant snapshot save bob $SNAPSHOT 
    else
        vagrant snapshot save $box $SNAPSHOT 
    fi
    exit 0
fi

if [ -z $box ]; 
then 
    vagrant snapshot restore $SNAPSHOT 
else
    vagrant snapshot restore $box $SNAPSHOT 
fi

exit 0
