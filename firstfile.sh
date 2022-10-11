#! /bin/bash/ -x

num=$((RANDOM%3))

wagePerHour=20
fullDayHour=8
halfDayHour=4

case $num in
	1)
		#echo "Full-day"
		fullDaySalary=$(($wagePerHour * $fullDayHour))
		#echo $fullDaySalary
	;;
	2)
		#echo "Half-day"
		halfDaySalary=$(($wagePerHour * $halfDayHour))
		#echo $halfDaySalary
	;;
	*)
		echo "Absent"
	;;
esac

