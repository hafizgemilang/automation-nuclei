#!/bin/bash
program=$1
mkdir -p "$program"

if [ -f "./domainsBOUNTY" ]
then
cat domainsBOUNTY | grep $program > $program/domain.txtls 
else
curl https://chaos-data.projectdiscovery.io/index.json | jq -M '.[] | .URL | @sh' | xargs -I@ sh -c 'wget @ -q'; mkdir bounty ; unzip '*.zip' -d bounty/ ; rm -rf *zip ; cat bounty/*.txt >> allbounty ; sort -u allbounty >> domainsBOUNTY ; rm -rf allbounty bounty/
cat domainsBOUNTY | grep $program > $program/domain.txtls 
fi

cd $program
cp ../program.sh .
chmod +x program.sh
./program.sh
cp ../nuclei.sh .
