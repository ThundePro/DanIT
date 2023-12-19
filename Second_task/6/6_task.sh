#!/bin/bash

input=$1

read -a words <<< "$input"
count=${#words[@]}
result=""

for ((i = $count-1; i >= 0; i--)); do
	result+=${words[$i]}
	result+=" "
	echo "i = $i, word = ${words[$i]}"
done

echo "Кількість слів у рядку: $count"
echo "Reverse: $result"
