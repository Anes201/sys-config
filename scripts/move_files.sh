#!/bin/bash

# this script moves a group of files with common string to a specific directory
 
for i in *.png
do
    mv "$i" "dalle/$i"
done
