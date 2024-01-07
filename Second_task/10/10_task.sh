#!/bin/bash

directory=/home/kali/watch
while true; do
	if [ -d "$directory" ]; then
		for file in "$directory"/*; do
			if [[ -f "$file" && ! "$file" =~ .back$ ]]; then
				echo "Content: $file"
				echo "----------"
				echo "$(cat $file)"
				echo "----------"
				mv $file $file.back
			fi
		done
	else
		echo "Каталог не існує"
	fi
sleep 3
done
