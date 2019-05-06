#! /bin/bash
# demo of messagebox with an OK button

# global variables
MSGBOX=${MSGBOX=dialog}
TITLE="default"
MESSAGE="some message"
XCOORD=10
YCOORD=20

# function declarations -start
# fucntion that declares message box with our message
functionDisplayMsgBox (){
    $MSGBOX --title "$1" --msgbox "$2" "$3" "$4"
}
# function declaration -stop

# script - start
if [ "$1" == "shutdown" ]; then
  functionDisplayMsgBox "Warning!" "Please press ok when you are ready to shut down the system" "10" "20"
  echo "Shutting Down Now!!"
else 
  functionDisplayMsgBox "Boring" "You are not asing for anything fun" "10" "20"
  echo "Not doing anything fun"
fi

# Script - stop