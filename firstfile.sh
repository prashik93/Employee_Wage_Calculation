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

while [[ (day -lt 20) || (totalWorkingHour -eq 100) ]]
do
	num=$((RANDOM%3))
	case $num in
		$fullDay)
			fullDaySalary=$(($wagePerHour * $fullDayHour))
			((presentFullDay++))
			totalWorkingHours=$(($totalWorkingHours+8))
		;;
		$halfDay)
			halfDaySalary=$(($wagePerHour * $halfDayHour))
			((presentHalfDay++))
			totalWorkingHours=$(($totalWorkingHours+4))
		;;
		*)
			fullDaySalary=$(($wagePerHour * $absentDayHour))
			((absent++))
		;;
	esac
	((day++))
done

#echo $presentFullDay
#echo $presentHalfDay
#echo $absent

wageForMonth=$(( ( (($presentFullDay * $fullDayHour) * $wagePerHour) + (($presentHalfDay * $halfDayHour) * $wagePerHour) + ($absent * 0)) ))
#echo $wageForMonth
#echo $wageForMonth

#echo $totalWorkingHours

