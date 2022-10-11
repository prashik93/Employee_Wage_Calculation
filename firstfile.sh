#! /bin/bash/ -x

num=$((RANDOM%2))

case $num in
	1)
		echo "Present"
	;;
	*)
		echo "Absent"
	;;
esac

