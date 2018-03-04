#!/bin/bash

first=`phantomjs fetchcover.js $1`

if [ "$first" == "404" ]
then
	echo "404"
	exit 1
fi

last=-1000
major=0

while [ $last != $first ]
do
	major=$(($major+100))
	last=`phantomjs fetchlast.js $1 $major`
done

minor=$(($major-100))

if [ `phantomjs fetchlast.js $1 $(($minor+50))` == $first ]
then
	major=$(($major-50))
else
	minor=$(($minor+50))
fi

last=-1000
i=$minor

while [ $last != $first ]
do
	i=$(($i+10))
	last=`phantomjs fetchlast.js $1 $i`
done

major=$i
minor=$(($major-10))

if [ `phantomjs fetchlast.js $1 $(($minor+5))` == $first ]
then
	major=$(($major-5))
else
	minor=$(($minor+5))
fi

last=-1000

for (( i=$minor; i<=$major; i++ ))
do
	last=`phantomjs fetchlast.js $1 $i`
	
	if [ $last == $first ]
	then
		break
	fi
done

last=$(($i-1))

echo "$first|$last"
