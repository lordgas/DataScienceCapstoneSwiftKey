#!/bin/bash
filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"
trigramsfile=$filename'_trigrams.txt'
trigramscountsfile=$filename'_trigrams_count.txt'
cat $1 | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | sed 's/,//' | sed G | tr ' ' '\n' > trigrams_tmp.txt

tail -n+2 trigrams_tmp.txt > trigrams_2_tmp.txt
tail -n+2 trigrams_2_tmp.txt > trigrams_3_tmp.txt        

paste -d ',' trigrams_tmp.txt trigrams_2_tmp.txt trigrams_3_tmp.txt | grep -v -e "^," | grep -v -e ",$"|grep -v -e ",,"|grep  -e "^[a-z]*,[a-z]*,[a-z]*$">$trigramsfile

cat $trigramsfile | sort | uniq -c | sort -rn|sed "s/^[ \t]*//" | tr ' ' ',' > $trigramscountsfile
rm trigrams*tmp.txt
