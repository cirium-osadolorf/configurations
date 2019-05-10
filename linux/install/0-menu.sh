#! /bin/bash
# dialog box menu 
: ${1?"USAGE: $1 USERNAME "}


# Global variables
MENUBOX=${MENUBOX=dialog}
TITLE=" [ M A I N  M E N U ] "
MESSAGE="Select the Application to Install"
XCOORD="15"
YCOORD="45"
N_OF_CHOICES="6"
USERNAME=$1


# Functions declaration - Start
# Function that initialize the MenuBOX
funDisplayMenu(){
  $MENUBOX --title "$TITLE" --menu "$MESSAGE" "$XCOORD" "$YCOORD" "$N_OF_CHOICES" 1 "Jenkins" 2 "Docker" 3 "Docker Compose" 4 "Terraform" 5 "Essentials" x "Exit" 2>choice.txt
}

funCloneRepo(){
  cd
  mkdir tmp
  cd tmp
  rm -rf configurations
  yum install -y git
  git clone https://github.com/FortunexFortune/configurations.git
}

funJenkinsInstall(){
  funCloneRepo
  chmod 766 configurations/linux/install/jenkins_cento_install.sh &&  configurations/linux/install/jenkins_cento_install.sh
}
funDockerInstall(){
  funCloneRepo
  chmod 766 configurations/linux/install/docker_cento_install.sh && configurations/linux/install/docker_cento_install.sh $1
}
funDockerComposeInstall(){
 chmod 766 configurations/linux/install/dockercompose_cento_install.sh && sudo configurations/linux/install/dockercompose_cento_install.sh
}
funTerraformInstall(){
  funCloneRepo
  chmod 766 configurations/linux/install/terraform_install.sh &&  configurations/linux/install/terraform_install.sh
}
funEssentialsInstall(){
  funCloneRepo
  chmod 766 configurations/linux/install/essentials_cento_install.sh && configurations/linux/install/essentials_cento_install.sh
}



# funcCleanUp(){
#   cd 
#   echo "======================================="
#   echo "$PWD"
#   echo "======================================="
#   rm -rf tmp
#   rm choice.txt
# }

# Script - start
if dialog --version 2>> /dev/null ; then
  echo "Very well, Dialog is already installed"
else
  echo "Installing Dialog ....."
  yum install -y dialog
fi

funDisplayMenu

case "`cat choice.txt`" in 
  1) funJenkinsInstall;;
  2) funDockerInstall $USERNAME;;
  3) funDockerComposeInstall;;
  4) funTerraformInstall;;
  5) funEssentialsInstall;;
  x) echo "exit";;
  *) echo "Input is not valid!!"
esac

# Script - stop

#sudo 0-menu.sh $USER
#sudo chmod 766 configurations/linux/install/0-menu.sh && sudo configurations/linux/install/0-menu.sh $USER
