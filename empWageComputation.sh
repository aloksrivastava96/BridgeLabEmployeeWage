#!/bin/bash -x

function attendanceCheck() {
	echo $((RANDOM%2))
}

function getDailyEmpWage() {
	totalWorkDay=0
	while [[ $totalWorkDay -lt $NO_OF_WORK_DAY ]]
	do
		attendance=$( attendanceCheck )
		dailyWage[(( totalWorkDay++ ))]=$(( $attendance*$EMP_FULL_DAY_HR*$EMP_WAGE_PER_HR ))
	done
	echo ${dailyWage[@]}
}

function empMain() {
	EMP_WAGE_PER_HR=20
	EMP_FULL_DAY_HR=8
	NO_OF_WORK_DAY=7
	getDailyEmpWage $EMP_WAGE_PER_HR $EMP_FULL_DAY_HR $NO_OF_WORK_DAY
}
echo "Welcome to Employee Wage Computation Program"
empMain
