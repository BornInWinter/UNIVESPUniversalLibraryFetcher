#!/bin/bash

img2pdf *.jpg -o "../../book/$1 - $2.pdf"

rm *.jpg
