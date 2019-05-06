#! /bin/bash
# dialog box menu 

# Global variables
MENUBOX=${MENUBOX=dialog}
TITLE=" [ M A I N  M E N U ] "
MESSAGE="Select the Application to Install"
XCOORD="15"
YCOORD="45"
N_OF_CHOICES="6"

# Functions declaration - Start
# Function that initialize the MenuBOX
funDisplayMenu(){
  $MENUBOX --title "$TITLE" --menu "$MESSAGE" "$XCOORD" "$YCOORD" "$N_OF_CHOICES" 1 "Jenkins" 2 "Docker" 3 "Terraform" 4 "Kubernetes" 5 "Essentials" x "Exit" 2>choice.txt
}

funCloneRepo(){
  cd
  #function that install jenkins
  funJenkinsInstall(){
  }

  funDockerInstall(){
  }
  funTerraformInstall(){
  }
  funKubernetesInstall(){
  }
  funEssentialsInstall(){
  }

}
# Function declaration - Stop

# Script - start
if dialog --version 2>> /dev/null ; then
  echo "Very well, Dialog is already installed"
else
  echo "Installing Dialog ....."
  yum install -y dialog
fi

funDisplayMenu
case "`cat choice.txt`" in 
  1) echo "installing Jenkins"
  2) echo "installing Docker";;
  3) echo "installing Terraform";;
  4) echo "installing Kubernetes";;
  5) echo "installing Essentials";;
  x) echo "exit";;
esac
# Script - stop