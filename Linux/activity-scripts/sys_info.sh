#!/bin/bash

#check for directory, create if it doesn't exist
if [ ! -d $HOME/research ]
then
	mkdir $HOME/research
fi
echo "A quick Audit Script" > ~/research/sys_info.txt
date >> ~/research/sys_info.txt
echo -e "Uname info: $(uname -a) \n" >> ~/research/sys_info.txt
echo -e "IP info: $(ip add | head -9 | tail -1) \n" >> ~/research/sys_info.txt
echo -e "Hostname: $HOSTNAME \n" >> ~/research/sys_info.txt
echo -e "DNS Servers: \n" >> ~/research/sys_info.txt
cat /etc/resolv.conf >> ~/research/sys_info.txt
echo -e "Memory Info: \n" >> ~/research/sys_info.txt
free >> ~/research/sys_info.txt
echo -e "\nCPU info: \n" >> ~/research/sys_info.txt
lscpu |grep CPU >> ~/research/sys_info.txt
echo -e "\nDisk Usage:" >> ~/research/sys_info.txt
df -h |head -7 >> ~/research/sys_info.txt
echo -e "\nWho is logged in: \n $(who -a) \n" >> ~/research/sys_info.txt

mkdir ~/research2 >> ~/research/sys_info.txt

echo -e "\nExecutable files in the system: \n" >> ~/research/sys_info.txt
sudo find / -type f -perm 777 >> ~/research/sys_info.txt

echo -e "\nTop 10 processes running: \n" >> ~/research/sys_info.txt
top -b -n 1 |head -n 17 |tail -n 11 >> ~/research/sys_info.txt
