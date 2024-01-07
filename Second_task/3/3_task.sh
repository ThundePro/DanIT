#!/bin/bash

result=$(ls | grep "^$1$")

if [ "$result" == "" ]; then
	echo "Файлу з такою назвою відсутній в даній дерикторії"
else 
	echo "Файл присутній а даній дерикторії"
fi
