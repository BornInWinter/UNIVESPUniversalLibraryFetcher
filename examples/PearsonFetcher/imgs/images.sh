#!/bin/bash

echo '	Downloading pages . . .'

for (( i=$2; i<=$3; i+=2 ))
do
	echo "		Downloading page: $i"

	img=`phantomjs fetchpdf.js "$1" $i`
	wget -q -P "../book/$4/" ${img//%20/ }

	if [ $i == $(($3-1)) ]
	then
		i=$(($i-1))
	fi
done
