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
  rm -rf configurations
  yum install -y git
  git clone https://github.com/FortunexFortune/configurations.git
  cd
  #function that install jenkins
  funJenkinsInstall(){
    chmod 766 configurations/linux/install/jenkins_cento_install.sh &&  configurations/linux/install/jenkins_cento_install.sh
  }
  funDockerInstall(){
    chmod 766 configurations/linux/install/docker_cento_install.sh && configurations/linux/install/docker_cento_install.sh $USER
  }
  funTerraformInstall(){
    chmod 766 configurations/linux/install/terraform_install.sh &&  configurations/linux/install/terraform_install.sh
  }
  funKubernetesInstall(){
  }
  funEssentialsInstall(){
    chmod 766 configurations/linux/install/essentials_cento_install.sh && configurations/linux/install/essentials_cento_install.sh
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
funCloneRepo

case "`cat choice.txt`" in 
  1) echo "installing Jenkins" && funJenkinsInstall
  2) echo "installing Docker" && funDockerInstall;;
  3) echo "installing Terraform" && funTerraformInstall;;
  4) echo "installing Kubernetes";;
  5) echo "installing Essentials" && funEssentialsInstall;;
  x) echo "exit";;
esac
# Script - stop
#sudo chmod 766 configurations/linux/install/0-menu.sh && sudo configurations/linux/install/0-menu.sh
