#!/bin/bash

cat newurls.txtls | nuclei -t /root/nuclei-templates/ -severity critical,medium,high,low > result.txt
