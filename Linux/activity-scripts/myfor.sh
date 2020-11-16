#!/bin/bash

cd /usr/bin
for file in *
do
	if [[ -f $file ]]
	then
		if
		strings $file |grep -q "unable to fork"
		then
		echo $file has \"unable to fork\" in it
		fi
	fi
done
