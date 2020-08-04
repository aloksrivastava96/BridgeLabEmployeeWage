#!/bin/bash -x

function attendanceCheck() {
	echo $((RANDOM%2))
}

function empMain() {
	attendance=$( attendanceCheck )
	if ((attendance))
	then
		echo "Present"
	else
		echo "Absent"
	fi
}
echo "Welcome to Employee Wage Computation Program"
empMain
