#! /bin/bash/ -x

num=$((RANDOM%2))

wagePerHour=20
fullDayHour=8

case $num in
	1)
		#echo "Present"
		perDaySalary=$(($wagePerHour * $fullDayHour))
		#echo $perDaySalary
	;;
	*)
		echo "Absent"
	;;
esac

