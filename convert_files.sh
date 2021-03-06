#!/bin/bash

set -eux

cd /files
if [ -a Makefile ]
then
	make
else
	for f in $(ls *tex)
	do
		pdflatex ${f}
		basef=$(echo $f | sed 's/.tex//g')
		convert -density 600x600 ${basef}.pdf -quality 90 -resize 1080x800 ${basef}.png
	done
fi
