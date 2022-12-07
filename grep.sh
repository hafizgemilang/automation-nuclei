#!/bin/bash
program=$1
mkdir -p "$program"

cat domainsBOUNTY | grep $program > $program/domain.txtls 
cd $program
cp ../program.sh .
chmod +x program.sh
./program.sh
cp ../nuclei.sh .
