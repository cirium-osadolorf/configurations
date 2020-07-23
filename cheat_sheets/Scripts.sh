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








################################################################################################
# unzip every file in the fodler
################################################################################################
# https://linuxconfig.org/how-to-change-welcome-message-motd-on-ubuntu-18-04-server


## /etc/update-motd.d/50-landscape-sysinfo

#!/bin/sh
cores=$(grep -c ^processor /proc/cpuinfo 2>/dev/null)
[ "$cores" -eq "0" ] && cores=1
threshold="${cores:-1}.0"
if [ $(echo "`cut -f1 -d ' ' /proc/loadavg` < $threshold" | bc) -eq 1 ]; then
    echo
    echo -n "  System information as of "
    /bin/date
    echo
    /usr/bin/landscape-sysinfo
else
    echo
    echo " System information disabled due to load higher than $threshold"
fi



################################################################################################
# list all files in directory without extension
################################################################################################

#!/bin/bash
set -e

TARGET_FOLDER="."
TABLES_PATH="${TARGET_FOLDER}/tables/"


echo "Populating the tables"

for i in $(ls ${TARGET_FOLDER}/tables/*.csv)
  do
  table=$(basename $i .csv) # remove .csv extension
  echo $table
done



