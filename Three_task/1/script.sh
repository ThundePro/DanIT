#!/bin/bash

distribution=$(uname -a | grep "ubuntu")
package=$(dpkg -l | grep sysstat)

if [ -n "$distribution" ]; then
	if [ -n "$package" ]; then
		sar -u 60 60 | awk '{ sum += $NF } END { if (NR > 0) print "Середнє використання CPU: " sum / NR }' >> /home/ubuntu/cpu-usage.log
	else
		echo "Please install sysstat. Write command: sudo apt install sysstat"
	fi
else
	echo "Error, this system not ubuntu"
fi
