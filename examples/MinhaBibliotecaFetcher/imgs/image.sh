#!/bin/bash

url=$1
last=$2

link='https://jigsaw.vitalsource.com'
remv='https://integrada.minhabiblioteca.com.br/#'
comp='?jigsaw_brand=integradaminhabiblioteca'

for (( i=193; i<=$last; i++ ))
do
	img=`phantomjs fetchimg.js "${url//$remv/$link}/$i$comp" | tail -n 1 | sed 's/800/1600/g'`

	echo "Downloading page $i . . ."

	pad=`printf "%05d" $i`
	phantomjs downloadimg.js "$link$img" $pad
done
