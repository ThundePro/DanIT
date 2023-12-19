#!/bin/bash

result=$(ls | grep "^$1$")

if [ "$result" == "" ]; then
	echo "Error the file does not exist"
else 
	echo "$(cat $result)"
fi
