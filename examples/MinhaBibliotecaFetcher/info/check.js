#!/bin/bash

echo "	Converting to pdf . . ."

cd "$2"
rm *.1 *.2 *.3 *.4 *.5 2> /dev/null

img2pdf *.jpg* -o "../$1 - $2.pdf"

cd ..
rm -r "$2"
