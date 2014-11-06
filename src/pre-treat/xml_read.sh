#!/bin/bash

xml_path="/run/user/zwh/gvfs/smb-share:server=114.212.190.147,share=lamda/zhengwh/data/"
file_name="Votes"
src_file=${xml_path}${file_name}".xml"
dst_path="/run/user/zwh/gvfs/smb-share:server=114.212.190.147,share=lamda/zhengwh/min_data/"

head_line=2
i=1
threshold=7000000
count=1

xml_start1=""
xml_start2=""
xml_end=`tail -1 $src_file`

while read LINE
do
    if [ $i -eq 1 ];
    then
        xml_start1=$LINE
        echo $LINE >> $dst_path$file_name"_"$count".xml"
    elif [ $i -eq 2 ];
    then
        xml_start2=$LINE
        echo $LINE >> $dst_path$file_name"_"$count".xml"
    else
        if [ $i -gt $threshold ];
        then
            i=3
            echo $xml_end >> $dst_path$file_name"_"$count".xml"
            count=$(expr $count + 1)
            echo $xml_start1 >> $dst_path$file_name"_"$count".xml"
            echo $xml_start2 >> $dst_path$file_name"_"$count".xml"
        fi 
        echo $LINE >> $dst_path$file_name"_"$count".xml"
    fi      
    i=$(expr $i + 1)
done < $src_file
echo $xml_end >> $dst_path$file_name"_"$count".xml"




