#!/bin/bash
dir_=./tests/bin/
for file in `ls $dir_`; do
    # echo $dir_
    # echo $file
    cp "$dir_$file" /mnt/
done