#!/bin/bash

source header.sh

while read line
do
	link=`echo $line | cut -d '|' -f 1`
	auth=`echo $line | cut -d '|' -f 2`
	titl=`echo $line | cut -d '|' -f 3`

	if [ "$link" == "" ] || [ "$link" == "https://"* ] || [ "$link" == *"/" ]
        then
                echo -e "\033[1;31m${error[1]}\033[0m" && exit 1
        elif [ "$auth" == "" ]
        then
                auth=`echo "$line" | cut -d '/' -f 3`
        elif [ "$titl" == "" ]
        then
                titl=`echo "$line" | rev | cut -d '/' -f 1 | rev`
        fi

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
 
 	echo -e "\033[1m> Starting download of:\033[0m $auth - $titl"
	
        phantomjs UNIVESPUniversalLibraryFetcher.js "$libr" "$user" "$pass" "$link" || echo -e "\033[1;31m${error[$?]}\033[0m"
done < $1
