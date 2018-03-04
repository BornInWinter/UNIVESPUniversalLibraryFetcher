#!/bin/bash

cat ascii

while read line
do
	link=`echo "$line" | cut -d '|' -f 1`
	auth=`echo "$line" | cut -d '|' -f 2`
	titl=`echo "$line" | cut -d '|' -f 3`

	echo ''
	echo "Fazendo o download do livro: $auth - $titl"

	cd info/

	fl=`./page.sh "$link"`

	if [ "$fl" == "404" ]
	then
		echo '=====> COOKIE INVÁLIDO <====='
		exit 1
	fi

	first=`echo $fl | cut -d '|' -f 1`
	last=`echo $fl | cut -d '|' -f 2`

	echo "	Primeira página: $first | Última página: $last"

	cd ..

	if [[ $first = _* ]]
	then
		echo "$link|$auth|$titl" >> failist
		echo "Download do livro '$auth - $titl' cancelado (veja no manual: BUG-1)"
		continue
	fi

	mkdir "book/${titl}"

	cd imgs/

	./images.sh "$link" $first $last "$titl"

	cd ../book/

	./pdfit.sh "$auth" "$titl"

	cd ..
done < $1
