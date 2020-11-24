#!/bin/bash

MyDIR="/home/neruthes/.minecraft/saves/NMW2"

LIST_MCA=$(ls $MyDIR/region)
echo $LIST_MCA > $MyDIR/region-split/index

rm -r $MyDIR/region-split/chunks
mkdir -p $MyDIR/region-split/chunks

touch $MyDIR/region-split/mkdir.sh
for i in $LIST_MCA; do
    echo "Processing $i"
    mkdir -p "$MyDIR/region-split/chunks/$i"
    split -b $((128*1024)) -d "$MyDIR/region/$i" "$MyDIR/region-split/chunks/$i/"
done
