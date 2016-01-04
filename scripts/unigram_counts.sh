#!/bin/bash
filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"
unigramsfile=$filename'_unigrams.txt'
unigramscountsfile=$filename'_unigrams_count.txt'
cat $1 | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr ' ' '\n' |  tr -d ' ' | grep  [a-z] | grep -v [0-9]| sort > $unigramsfile
cat $unigramsfile | uniq -c | sort -rn > $unigramscountsfile
