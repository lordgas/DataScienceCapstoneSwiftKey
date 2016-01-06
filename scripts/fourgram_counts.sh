#!/bin/bash
filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"
fourgramsfile=$filename'_fourgrams.txt'
fourgramscountsfile=$filename'_fourgrams_count.txt'
cat $1 | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | sed 's/,//' | sed G | tr ' ' '\n' > fourgrams_tmp.txt

tail -n+2 fourgrams_tmp.txt > fourgrams_2_tmp.txt
tail -n+2 fourgrams_2_tmp.txt > fourgrams_3_tmp.txt        
tail -n+2 fourgrams_3_tmp.txt > fourgrams_4_tmp.txt  
      
paste -d ',' fourgrams_tmp.txt fourgrams_2_tmp.txt fourgrams_3_tmp.txt fourgrams_4_tmp.txt | grep -v -e "^," | grep -v -e ",$"|grep -v -e ",,"|grep  -e "^[a-z]*,[a-z]*,[a-z]*,[a-z]*$">$fourgramsfile

cat $fourgramsfile | sort | uniq -c | sort -rn|sed "s/^[ \t]*//" | tr ' ' ',' > $fourgramscountsfile
rm fourgrams*tmp.txt
