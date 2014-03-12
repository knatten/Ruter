#!/bin/bash

outfile="MockData.uno"

cp "MockDataTemplate.uno" $outfile

for file in `ls Data`
do
    id=`echo $file | sed s/.txt//`
    echo $id
    echo $file
    string=`cat Data/$file`
    line="Data.Add($id, \"$string\");"
    echo $line >> MockData.uno
done

echo "}}}" >> MockData.uno
