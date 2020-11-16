#!/bin/bash

#create a list
pw_files=( '/etc/passwd' '/etc/shadow' '/var/log/syslog' )

#print permissions on the files in the list
for file in ${pw_files[@]};
do
	ls -l $file
done

