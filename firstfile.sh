##! /bin/bash/ -x

fullDay=1
halfDay=2

wagePerHour=20
fullDayHour=8
halfDayHour=4
absentDayHour=0

workingDayPerMonth=20
presentFullDay=0
presentHalfDay=0
absent=0

totalWorkingHours=0

declare -a dailyAndTotalWageArray

index=${#dailyAndTotalWageArray[@]}


function calculateHours(){
	if [ $1 -eq $fullDay ]
	then
		totalWorkingHours=$(($totalWorkingHours+8))
		dailyWage=$(($totalWorkingHours * $wagePerHour))
		dailyAndTotalWageArray[$index]=$dailyWage

	elif [ $2 -eq $halfDay ]
	then
		totalWorkingHours=$(($totalWorkingHours+4))
		dailyWage=$(($totalWorkingHours * $wagePerHour))
		dailyAndTotalWageArray[$index]=$dailyWage
	else
		dailyWage=$(($totalWorkingHours * $wagePerHour))
		dailyAndTotalWageArray[$index]=$dailyWage
	fi
	((index++))
}

while [[ (day -lt 20) || (totalWorkingHour -eq 100) ]]
do
	num=$((RANDOM%3))
	case $num in
		$fullDay)
			fullDaySalary=$(($wagePerHour * $fullDayHour))
			((presentFullDay++))
			calculateHours $fullDay 0 0
		;;
		$halfDay)
			halfDaySalary=$(($wagePerHour * $halfDayHour))
			((presentHalfDay++))
			calculateHours 0 $halfDay 0

		;;
		*)
			fullDaySalary=$(($wagePerHour * $absentDayHour))
			((absent++))
			calculateHours 0 0 0
		;;
	esac
	((day++))
done


wageForMonth=$((totalWorkingHours * wagePerHour))

echo "Full Day Present :- $presentFullDay"
echo "Half Day Present :- $presentHalfDay"
echo "Absent :- $absent"
echo "Salary for a month :- $wageForMonth"
echo "Total Working Hours :- $totalWorkingHours"

echo "Daily Wage :- $dailyWage"
echo "Daily and Total wage Array :- ${dailyAndTotalWageArray[@]}"

