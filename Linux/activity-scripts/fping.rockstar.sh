#!/bin/bash


for ip in $(cat rockstar.hollywood.networks)
do
		fping -a -r 0 -g $ip
		#echo $ip
done

