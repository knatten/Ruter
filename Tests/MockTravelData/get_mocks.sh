#!/bin/bash

rm -f Data/*
for id in `cat ../../Configuration.uno | grep "new Watch" | sed -n 's/.*\([0-9][0-9][0-9][0-9][0-9][0-9][0-9]\)).*/\1/p'`
do
    url="http://reis.ruter.no/reisrest/realtime/getrealtimedata/$id"
    file="Data/$id.txt"
    cmd="wget -O $file $url"
    $cmd
    cat $file | sed s/\"/\\\\\"/g | sed s/\\\\\\//\\//g > $file".tmp"
    mv $file".tmp" $file
done
