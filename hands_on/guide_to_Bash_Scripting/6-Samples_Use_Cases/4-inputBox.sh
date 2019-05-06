#! /bin/bash
# demo of a an niput dialog box

# global variables
INPUTBOX=${INPUTBOX=dialog}
TITLE="default"
MESSAGE="Something to display"
XCOORD=10
YCOORD=20

# function declaration -start
functionDisplayBox (){
  $INPUTBOX --title $1 --inputbox "$2" "$3" "$4" 2>tmpfile.txt

}
# function declaration -stop

# script - start
functionDisplayBox "$TITLE" "$MESSAGE" "$XCOORD" "$YCOORD"
if [ "`cat tmpfile.txt`" != "" ]; then
  cat "`cat tmpfile.txt`"
else 
  echo "nothing to do"
fi 

# Script - stop