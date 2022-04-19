#!/bin/sh

if [ "$1" ]
then
    curl -I --silent $1 | grep "[l,L]ocation: " | cut -c11-
else
    echo "[usage:] ./myawesomescript.sh [bit.ly]"
fi