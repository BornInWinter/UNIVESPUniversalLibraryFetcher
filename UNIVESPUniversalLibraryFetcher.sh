#!/bin/bash

source header.sh

while read line
do

	link=`echo $line | cut -d '|' -f 1`
	auth=`echo $line | cut -d '|' -f 2`
	titl=`echo $line | cut -d '|' -f 3`

	libr=''

	case "$link" in
		*univesp.bv3.digitalpages.com.br*)
			libr='pearson'
			;;
			
		*integrada.minhabiblioteca.com.br*)
			libr='mylib'
			;;

		*evolution.com.br*)
			libr='evolution'
			;;
	esac	
  
done < $1
