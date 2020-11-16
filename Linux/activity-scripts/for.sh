#!/bin/bash

#list variable
months=(
	'January'
	'February'
	'March'
	'April'
	'May'
	'June'
	'July'
	'August'
	'September'
	'October'
	'November'
	'December'
)
days=('Mon' 'Tues' 'Wed' 'Thurs' 'Fri' 'Sat' 'Sun')

#for month in ${months[@]};
#for month in ${months[0..5]};
#do
#	echo $month
#done

for day in ${days[@]}
do
	if [ $day = 'Sun' ] || [ $day = 'Sat' ]
	then
		echo "This is the weekend"
	else
		echo "Go to work"
	fi
done
