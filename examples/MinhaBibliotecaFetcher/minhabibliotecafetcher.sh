#!/bin/bash

while read line
do
	link=`echo $line | cut -d '|' -f 1`
	auth=`echo $line | cut -d '|' -f 2`
	titl=`echo $line | cut -d '|' -f 3`

	cd info/

	last=`./page.sh "$link"`
	
	cd ../imgs/

	./image.sh "$link" $last

	cd book/

	./pdfit.sh "$auth" "$titl"

	cd ../../
done < $1
