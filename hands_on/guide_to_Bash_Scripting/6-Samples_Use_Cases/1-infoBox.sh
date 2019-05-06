#! /bin/bash
#demo of a simple info box with dialog and ncurses

#global variables / default values
INFOBOX=${INFOBOX=dialog}
MESSAGE="Something to say"
XCOORD=10
YCOORD=20

#function dclaration - start
funcDisplayIinfoBox(){
  $INFOBOX --title "$1" --infobox "$2" "$3" "$4" 
}
#function declaration - stop

#script -start
if [ "$1" == "shutdown" ]; then
  funcDisplayIinfoBox "Warning" "We are shuttting dow the system" "11"  "21" "5"
  echo "Shutting Down!"
else 
  funcDisplayIinfoBox "information" "you are not doing anythin fun" "11" "21" "5"
  echo "not doing anything"
fi 

#script - stop