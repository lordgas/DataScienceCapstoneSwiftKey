#!/bin/bash
filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"
bigramsfile=$filename'_bigrams.txt'
bigramscountsfile=$filename'_bigrams_count.txt'


cat $1 | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | sed 's/,//' | sed G | tr ' ' '\n' > $bigramsfile
tail -n+2 $bigramsfile >bigrams_2_tmp.txt  
paste -d ',' $bigramsfile bigrams_2_tmp.txt | grep -v -e "^," | grep -v -e ",$"|grep  -e "^[a-z]*,[a-z]*$"  | sort | uniq -c | sort -rn > $bigramscountsfile
rm bigrams_2_tmp.txt
