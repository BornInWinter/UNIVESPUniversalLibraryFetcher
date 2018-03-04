#!/bin/bash

url=$1

major=0
minor=0

while [ $major == $minor ]
do
	major=$(($major+100))
	minor=`phantomjs check.js "$url" $major | tail -n 1`
done

if [ `phantomjs check.js "$url" $(($minor+50)) | tail -n 1` != $minor ]
then
	minor=$(($minor+50))
fi

major=$minor

while [ $major == $minor ]
do
	major=$(($major+10))
	minor=`phantomjs check.js "$url" $major | tail -n 1`
done

if [ `phantomjs check.js "$url" $(($minor+5)) | tail -n 1` != $minor ]
then
	minor=$(($minor+5))
fi

major=$minor

while [ $major == $minor ]
do
	major=$(($major+1))
	minor=`phantomjs check.js "$url" $major | tail -n 1`
done

echo "$minor"
