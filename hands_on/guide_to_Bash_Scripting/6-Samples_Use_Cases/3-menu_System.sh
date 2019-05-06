#! /bin/bash
# demo of a dialog box that will dispaly a menu

# global variables / deafult varaibles
MENUBOX=${MENUBOX=dialog}
TITLE=" [ M A I N  M E N U ] "
MESSAGE="Use UP/DOWN Arrows to Move and Select the Number of your Choice and Enter"
XCOORD="15"
YCOORD="45"
N_OF_OPTIONS="4"
OPTION1="Display Hello World"
OPTION2="Display Goodbye World"
OPTION3="Display Nothing"
OPTIONX="Exit"

# function declaration - start

# function to display a simple menu
funcDisplayDialogMenu (){
  $MENUBOX --title "$TITLE" --menu "$MESSAGE" "$XCOORD" "$YCOORD" "$N_OF_OPTIONS" 1 "$OPTION1" 2 "$OPTION2" 3 "$OPTION3" X "$OPTIONX" 2>choice.txt
}

# function declaration - stop 

# Script - start
funcDisplayDialogMenu
case "`cat choice.txt`" in
  1) echo "hello world";;
  2) echo "Goodbye World";;
  3) echo "Nothing";;
  4) echo "exit";;
esac
# Script - stop