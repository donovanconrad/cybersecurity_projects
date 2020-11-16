#!/bin/bash

# This script takes input from the command line. It needs the date and time in the specified format. 
# A usage message is displayed when the script is run with no arguments.
# Additional safeguards could be added to ensure proper argument input.
# The date argument is used to create the input file name.
# The time arguments are used to create the proper format found in the input file.
# The output is displayed to the screen unless redirected at the command line.
# Auth Donovan Conrad

if [[ $1 == "" ]]
then
	echo "Usage: /roulette_dealer_by_time.sh date time "
	echo "Date format: 0312"
	echo "Time format: 08:00 PM"
	echo "Example: ./roulette_dealer_by_time.sh 0310 05:00 AM"
	exit 0
fi

grep "$2:00 $3" $1_Dealer_schedule | awk -F" " '{print $5, $6}'
