#!/bin/bash


for ip in {26..32}
do
		fping -c 4 107.191.96.$ip
done

