#!/bin/bash

httpx -l domain.txtls -o newurls.txtls &> /dev/null
cat newurls.txtls | cut -d " " -f2 | cut -d "[" -f1 >> live.txtls
cat newurls.txtls | cut -d " " -f1 >> live.txtls
cat live.txtls | anew | sed '/^$/d' >> newurls.txtls
echo "Total $(wc -l < newurls.txtls) live websites found" 
