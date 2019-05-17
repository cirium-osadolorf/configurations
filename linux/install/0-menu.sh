#! /bin/bash
# dialog box menu 
: ${2?"USAGE: $1 USERNAME  $2 USER_HOME" } 


# Global variables
MENUBOX=${MENUBOX=dialog}
TITLE=" [ M A I N  M E N U ] "
MESSAGE="Select the Application to Install"
XCOORD="15"
YCOORD="45"
N_OF_CHOICES="6"
USERNAME=$1
USER_HOME=$2

# Functions declaration - Start
# Function that initialize the MenuBOX
funDisplayMenu(){
  $MENUBOX --title "$TITLE" --menu "$MESSAGE" "$XCOORD" "$YCOORD" "$N_OF_CHOICES" 1 "Jenkins" 2 "Docker" 3 "Docker Compose" 4 "Terraform" 5 "Essentials" x "Exit" 2>$USER_HOME/choice.txt
}

funCloneRepo(){
  cd $1
  rm -rf configurations
  yum install -y git
  git clone https://github.com/FortunexFortune/configurations.git
}

funJenkinsInstall(){
  funCloneRepo 
  #chmod 766 configurations/linux/install/jenkins_cento_install.sh &&  configurations/linux/install/jenkins_cento_install.sh

}
funDockerInstall(){
  funCloneRepo 
  #chmod 766 configurations/linux/install/docker_cento_install.sh && configurations/linux/install/docker_cento_install.sh $1
}
funDockerComposeInstall(){
 funCloneRepo 
 #chmod 766 configurations/linux/install/dockercompose_cento_install.sh && sudo configurations/linux/install/dockercompose_cento_install.sh
}
funTerraformInstall(){
  funCloneRepo 
  #chmod 766 configurations/linux/install/terraform_install.sh &&  configurations/linux/install/terraform_install.sh
}
funEssentialsInstall(){
  funCloneRepo 
 # chmod 766 configurations/linux/install/essentials_cento_install.sh && configurations/linux/install/essentials_cento_install.sh
}


# Script - start
if dialog --version 2>> /dev/null ; then
  echo "Very well, Dialog is already installed"
else
  echo "Installing Dialog ....."
  yum install -y dialog
fi

funDisplayMenu $USER_HOME

case "`cat $USER_HOME/choice.txt`" in 
  1) funJenkinsInstall ;;
  2) funDockerInstall $USERNAME;;
  3) funDockerComposeInstall;;
  4) funTerraformInstall;;
  5) funEssentialsInstall;;
  x) echo "exit";;
esac

# Script - stop

#sudo ./0-menu.sh $USER $HOME
#sudo chmod 766 configurations/linux/install/0-menu.sh && sudo configurations/linux/install/0-menu.sh $USER
