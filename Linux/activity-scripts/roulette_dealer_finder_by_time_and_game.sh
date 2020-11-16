#!/bin/bash

# This script takes input from the command line. It needs the date, time, and game in the specified format. 
# A usage message is displayed when the script is run with no arguments or if an invalid game character is entered.
# Additional safeguards could be added to ensure proper argument input.
# The date argument is used to create the input file name.
# The time arguments are used to create the proper format found in the input file.
# The output is displayed to the screen unless redirected at the command line.
# Auth Donovan Conrad

if [[ $1 == "" ]]
then
	echo "Usage: /roulette_dealer_by_time_and_game.sh date time game"
	echo "Date format: 0312"
	echo "Time format: 08:00 PM"
	echo "Game format: B or R or T - for Blackjack, Roulette, or Texas Hold 'em"
	echo "Example: ./roulette_dealer_by_time_and_game.sh 0310 05:00 AM T"
	exit 0
fi
if [[ $4 == "B" ]]
then
	grep "$2:00 $3" $1_Dealer_schedule | awk -F" " '{print $3, $4}'
elif [[ $4 == "R" ]]
then
	grep "$2:00 $3" $1_Dealer_schedule | awk -F" " '{print $5, $6}'
elif [[ $4 == "T" ]]
then
	grep "$2:00 $3" $1_Dealer_schedule | awk -F" " '{print $7, $8}'
else 
	echo "Invalid input, expecting B, R, or T for game choice. Please see usage:"
	echo " "
        echo "Usage: /roulette_dealer_by_time_and_game.sh date time game"
        echo "Date format: 0312"
        echo "Time format: 08:00 PM"
        echo "Game format: B or R or T - for Blackjack, Roulette, or Texas Hold 'em"
        echo "Example: ./roulette_dealer_by_time_and_game.sh 0310 05:00 AM T"
        exit 0
	
fi
