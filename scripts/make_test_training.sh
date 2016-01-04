#!/bin/bash

line_no=$(wc -l < $1)
echo 'number of lines: '+ $line_no

test="$((20 * $line_no /100))"
train="$((80 * $line_no /100))"

filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"
echo $train
head -n $train $1 > $filename'_train.'$extension
echo $test
tail -n $test $1 > $filename'_test.'$extension
