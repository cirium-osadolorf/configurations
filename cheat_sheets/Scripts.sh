################################################
# unzip every file in the fodler
################################################

#! /bin/bash
FILES=*
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  gzip -d $f
done
