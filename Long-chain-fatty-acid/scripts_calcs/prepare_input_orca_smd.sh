#!/bin/bash

solvent_list_file="solvent_list_smd.log"
nn=1
keyword="SMDSOLVENT"
input_file="template-input-orca-smd"

while read line; do

new_string="  $keyword  \"$line\" "
new_file=job_$nn

echo $new_string  $new_file

sed -i "/$keyword/c  $new_string"   $input_file
mkdir $new_file ; cp  $input_file  $new_file/input-orca;   cp data-in.xyz $new_file/data-in.xyz

nn=$((nn+1))
done < $solvent_list_file


