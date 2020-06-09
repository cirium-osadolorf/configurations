################################################
# unzip every file in the fodler
################################################
# https://www.jamf.com/jamf-nation/discussions/25560/loop-through-files-bash-help
#! /bin/bash
FILES=*
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  gzip -d $f
done
