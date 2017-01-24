#!/usr/bin/env bash

cd ../blabla/0
files=(*.md)

for i in {0..3}; do
    echo ${files[$i]}
    pandoc -s -S -f markdown -t html ${files[$i]}  --template=../../pandoc/miniTemplate.html -o ../../pandoc/tmp/$i.html\
           --variable id=$i\
           --variable title=${files[$i]} 

    if [ $i -eq 0 ]
    then
        strN="<a href=\"#1\">next</a>"
        sed -i "$ i ${strN}" ../../pandoc/tmp/$i.html
    elif [ $i -eq 4 ]
    then
        strP="<a href=\"#3\">previous</a>"
        sed -i "2 a ${strP}" ../../pandoc/tmp/$i.html
    else
        c=$(($i+1))
        cc=$(($i-1))
        strN="<a href=\"#${c}\">next</a>"
        strP="<a href=\"#${cc}\">previous</a>"
        sed -i "2 a ${strP}" ../../pandoc/tmp/$i.html
        sed -i "$ i ${strN}" ../../pandoc/tmp/$i.html
    fi


done


cd ../../pandoc
# put in the template

cat tmp/* > caca
cp template.html site/index.html
sed -i '43r caca' site/index.html
rm caca
