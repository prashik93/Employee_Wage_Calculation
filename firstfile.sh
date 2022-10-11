#! /bin/bash/ -x

num=$((RANDOM%3))

wagePerHour=20
fullDayHour=8
halfDayHour=4

if [ $num -eq 1 ]
then
	#echo "Full-day"
	fullDaySalary=$(($wagePerHour * $fullDayHour))
	#echo $fullDaySalary

elif [ $num -eq 2 ]
then
	#echo "Half-day"
	halfDaySalary=$(($wagePerHour * $halfDayHour))
	#echo $halfDaySalary

else
	echo "Absent"

fi

