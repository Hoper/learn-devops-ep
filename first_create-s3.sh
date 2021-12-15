#!/bin/bash
#ctreate S3 with random name 
S3_POSTFIX=$(echo $RANDOM | md5sum | head -c 20)
echo "name of S3 bukcet for state file terraform: terr-state-"$S3_POSTFIX
aws --profile my-awsuser s3api create-bucket --bucket terr-state-$S3_POSTFIX
#replace name of s3 bucket in ./backend.tf file
sed -i "s/bucket[[:blank:]]*=/bucket  = \"terr-state-$S3_POSTFIX\"   #/" ./backend.tf