#! /bin/bash/ -x

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

function calculateHours(){
	if [ $1 -eq $fullDay ]
	then
		totalWorkingHours=$(($totalWorkingHours+8))

	elif [ $2 -eq $halfDay ]
	then
		totalWorkingHours=$(($totalWorkingHours+4))
	fi
}

while [[ (day -lt 20) || (totalWorkingHour -eq 100) ]]
do
	num=$((RANDOM%3))
	case $num in
		$fullDay)
			fullDaySalary=$(($wagePerHour * $fullDayHour))
			((presentFullDay++))
			calculateHours $fullDay 0
		;;
		$halfDay)
			halfDaySalary=$(($wagePerHour * $halfDayHour))
			((presentHalfDay++))
			calculateHours 0 $halfDay
		;;
		*)
			fullDaySalary=$(($wagePerHour * $absentDayHour))
			((absent++))
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

