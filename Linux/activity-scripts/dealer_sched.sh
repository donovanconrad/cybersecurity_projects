#!/bin/bash

# This script takes input from the command line. It needs the input file name and time in the specified format. 
# A usage message is displayed when the script is run with no arguments.
# Additional safeguards could be added to ensure proper argument input.
# The time arguments are used to create the proper format found in the input file.
# The output is redirected and appended to the file Dealers_working_during_losses.
# Auth Donovan Conrad
 
if [[ $1 == "" ]]
then
	echo "Usage: /dealer_sched.sh Input_file_name time (XX) AM/PM"
	echo "Example: ./dealer_sched.sh 0310_Dealer_schedule 05 AM"
	exit 0
fi
grep "$2:00:00 $3" $1 | awk -F" " '{print $1, $2, $5, $6}' >>Dealers_working_during_losses
