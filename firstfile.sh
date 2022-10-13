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
assumeWorkingHours=100
totalDays=0

declare -a dailyAndTotalWageArray
declare -A dayAndTotalWageDictionary

index=${#dailyAndTotalWageArray[@]}


function calculateHours(){
	if [ $1 -eq $fullDay ]
	then
		totalWorkingHours=$(($totalWorkingHours + $fullDayHour))
		dailyWage=$(($totalWorkingHours * $wagePerHour))
		dailyAndTotalWageArray[$index]=$dailyWage
		dayAndTotalWageDictionary[$totalDays]=$dailyWage

	elif [ $2 -eq $halfDay ]
	then
		totalWorkingHours=$(($totalWorkingHours + $halfDayHour))
		dailyWage=$(($totalWorkingHours * $wagePerHour))
		dailyAndTotalWageArray[$index]=$dailyWage
		dayAndTotalWageDictionary[$totalDays]=$dailyWage

	else
		dailyWage=$(($totalWorkingHours * $wagePerHour))
		dailyAndTotalWageArray[$index]=$dailyWage
		dayAndTotalWageDictionary[$totalDays]=$dailyWage
	fi
	((index++))
}

while [[ (day -lt $workingDayPerMonth) || ($totalWorkingHour -eq $assumeWorkingHours) ]]
do
	num=$((RANDOM%3))
	case $num in
		$fullDay)
			fullDaySalary=$(($wagePerHour * $fullDayHour))
			((presentFullDay++))
			totalDays=$(($totalDays+1))
			calculateHours $fullDay
		;;
		$halfDay)
			halfDaySalary=$(($wagePerHour * $halfDayHour))
			((presentHalfDay++))
			totalDays=$(($totalDays+1))
			calculateHours 0 $halfDay

		;;
		*)
			fullDaySalary=$(($wagePerHour * $absentDayHour))
			((absent++))
			totalDays=$(($totalDays+1))
			calculateHours 0 0 0
		;;
	esac
	((day++))
done


wageForMonth=$((totalWorkingHours * wagePerHour))

dayAndDailyWages=`for key in "${!dayAndTotalWageDictionary[@]}";do echo "$key = ${dayAndTotalWageDictionary[$key]}";done | sort -n`


echo "Full Day Present :- $presentFullDay"
echo "Half Day Present :- $presentHalfDay"
echo "Absent :- $absent"
echo "Salary for a month :- $wageForMonth"
echo "Total Working Hours :- $totalWorkingHours"

echo "Daily Wage :- $dailyWage"
echo "Daily and Total wage Array :- ${dailyAndTotalWageArray[@]}"

echo "Day and daily wage along with total wage :- ${!dayAndTotalWageDictionary[@]}"
echo "Day and daily wage along with total wage :- ${dayAndTotalWageDictionary[@]}"
echo "Day and daily wage along with total wage :- ${#dayAndTotalWageDictionary[@]}"

echo "Day and daily wages :- $dayAndDailyWages"
