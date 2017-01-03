cd ../blabla
for i in *; do
    pandoc -s -S -f markdown -t html $i/[0-9]*.md  --template=../pandoc/miniTemplate.html -o ../pandoc/tmp/$i.html\
           --variable title=$i
    # insert a "next" item
    next=$(( $i + 1 ))
    prev=$(( $i - 1 ))
    strN="<a href=\"#${next}\">next</a>"
    strP="<a href=\"#${prev}\">previous</a><p><\p>"
    #image=    "<span class=\"image main\"><img src=\"images\pic01.jpg\" alt="" /></span>"
    #insert
    #previous
    sed -i "2 a ${strP}" ../pandoc/tmp/$i.html
    #image
    # if [ -f file]
    # then
    #     sed -i "2 a ${image}" ../pandoc/tmp/$i.html
    # fi
    #next
    sed -i "$ i ${strN}" ../pandoc/tmp/$i.html

done


cd ../pandoc
# put in the template

cat tmp/* > caca
cp template.html site/index.html
sed -i '43r caca' site/index.html
rm caca
