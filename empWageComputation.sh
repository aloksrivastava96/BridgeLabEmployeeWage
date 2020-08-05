#!/bin/bash -x

function attendanceCheck() {
	echo $((RANDOM%2))
}

function getDailyEmpWage() {
	dailyWage[$totalWorkDay]=$(( $EMP_DAY_HR*$EMP_WAGE_PER_HR ))
	echo ${dailyWage[totalWorkDay]}
}

function getWorkingHr() {
	attendance=$( attendanceCheck )
	case $isFullTime in
		0)
			EMP_DAY_HR=$(($attendance*4))
			;;
		1)
			EMP_DAY_HR=$(($attendance*8))
			;;
	esac
	echo $EMP_DAY_HR
}

function empMain() {
	EMP_WAGE_PER_HR=20
	EMP_FULL_DAY_HR=8
	EMP_PART_DAY_HR=4
	NO_OF_WORK_DAY=20

	totalEmpHr=0
	totalWorkDay=0
	while [[ $totalWorkDay -lt $NO_OF_WORK_DAY ]]
        do
                isFullTime=$((RANDOM%2))
		EMP_DAY_HR=$( getWorkingHr $isFullTime )
		totalEmpHr=$(( $totalEmpHr + $EMP_DAY_HR ))
                echo "Emp Wage for this day is:"$( getDailyEmpWage $totalWorkDay $EMP_DAY_HR $EMP_WAGE_PER_HR )
		((totalWorkDay++))
        done
	totalWage=$(($totalEmpHr*$EMP_WAGE_PER_HR))
	echo "Total wage of a employee for this month is:"$totalWage
}
echo "Welcome to Employee Wage Computation Program"
empMain
