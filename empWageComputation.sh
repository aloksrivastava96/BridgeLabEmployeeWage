#!/bin/bash -x

function attendanceCheck() {
	echo $((RANDOM%2))
}

function getDailyEmpWage() {
	dailyWage[$totalWorkDay]=$(( $attendance*$EMP_DAY_HR*$EMP_WAGE_PER_HR ))
	echo ${dailyWage[totalWorkDay]}
}

function empMain() {
	EMP_WAGE_PER_HR=20
	EMP_FULL_DAY_HR=8
	EMP_PART_DAY_HR=4
	NO_OF_WORK_DAY=7

	totalEmpHr=0
	totalWorkDay=0
	while [[ $totalWorkDay -lt $NO_OF_WORK_DAY ]]
        do
                isFullTime=$((RANDOM%2))
                if ((isFullTime==1))
                then
                        EMP_DAY_HR=$EMP_FULL_DAY_HR
                else
                        EMP_DAY_HR=$EMP_PART_DAY_HR
                fi
                attendance=$( attendanceCheck )
		totalEmpHr=$(( $totalEmpHr + (($attendance*$EMP_DAY_HR)) ))
                echo "Emp Wage for this day is:"$( getDailyEmpWage $totalWorkDay $attendance $EMP_DAY_HR $EMP_WAGE_PER_HR )
		((totalWorkDay++))
        done
	totalWage=$(($totalEmpHr*$EMP_WAGE_PER_HR))
	echo "Total wage of the employee is:"$totalWage
}
echo "Welcome to Employee Wage Computation Program"
empMain
