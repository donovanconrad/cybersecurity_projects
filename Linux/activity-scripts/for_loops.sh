#!/bin/bash

fav_states=( 'Georgia' 'Minnesota' 'California' 'Florida' 'New York' )

for state in ${fav_states[@]};
do
	if [ $state = Hawaii ]
	then
		echo $state "is the best"
	else
		echo "I'm not fond of Hawaii"
	fi
done

#num_list=$(seq 0 9)
num_list=$(echo {0..9})

for num in ${num_list[@]}
do
	if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
	then
		echo $num
	fi
done

