#! /bin/bash
# dialog box menu 
: ${2?"USAGE: $1 USERNAME  $2 USER_HOME" } 

# Global variables
MENUBOX=${MENUBOX=dialog}
TITLE=" [ M A I N  M E N U ] "
MESSAGE="Select the Application to Install"
XCOORD="15"
YCOORD="45"
N_OF_CHOICES="9"
USERNAME=$1
USER_HOME=$2

# Functions declaration - Start
# Function that initialize the MenuBOX
funDisplayMenu(){
  $MENUBOX --title "$TITLE" --menu "$MESSAGE" "$XCOORD" "$YCOORD" "$N_OF_CHOICES" 1 "Jenkins" 2 "Docker" 3 "Docker Compose" 4 "Terraform" 5 "Essentials" 6 "Nginx" 7 "K8s_Master" 8 "K8s_Node"   x "Exit" 2>$USER_HOME/choice.txt
}

funCloneRepo(){
  cd $1
  rm -rf configurations
  apt-get install -y git
  git clone https://github.com/FortunexFortune/configurations.git
}

funJenkinsInstall(){
  funCloneRepo 
  chmod 766 configurations/linux/install/ubuntu/jenkins_install.sh && configurations/linux/install/ubuntu/jenkins_install.sh
}

funDockerInstall(){
  funCloneRepo 
  chmod 766 configurations/linux/install/ubuntu/docker_install.sh && configurations/linux/install/ubuntu/docker_install.sh $1
}

funDockerComposeInstall(){
 funCloneRepo 
 chmod 766 configurations/linux/install/ubuntu/dockercompose_install.sh && configurations/linux/install/ubuntu/dockercompose_install.sh
}

funTerraformInstall(){
  funCloneRepo 
  chmod 766 configurations/linux/install/ubuntu/terraform_install.sh && configurations/linux/install/ubuntu/terraform_install.sh
}

funEssentialsInstall(){
  funCloneRepo 
  chmod 766 configurations/linux/install/ubuntu/essentials_install.sh && configurations/linux/install/ubuntu/essentials_install.sh
}

funNginxInstall(){
 funCloneRepo 
 chmod 766 configurations/linux/install/ubuntu/nginx_isntall.sh && configurations/linux/install/ubuntu/nginx_isntall.sh

}

fun_K8s_Master_Install(){
  funCloneRepo 
  #K8 Master installer
}

fun_K8s_Node_Install(){
  funCloneRepo 
  #K8 worrker installer
}

# Script - start
if dialog --version 2>> /dev/null ; then
  echo "Very well, Dialog is already installed"
else
  echo "Installing Dialog ....."
  apt-get install -y dialog
fi

funDisplayMenu $USER_HOME

case "`cat $USER_HOME/choice.txt`" in 
  1) funJenkinsInstall ;;
  2) funDockerInstall $USERNAME;;
  3) funDockerComposeInstall;;
  4) funTerraformInstall;;
  5) funEssentialsInstall;;
  6) funNginxInstall;;
  7) fun_K8s_Master_Install $USERNAME $USER_HOME;;
  8) fun_K8s_Node_Install;;
  x) echo "exit";;
esac

cd $USER_HOME 
rm -rf $USER_HOME/choice.txt
rm -rf $USER_HOME/configurations

# Script - stop

#sudo ./0-menu.sh $USER $HOME
#sudo chmod 766 configurations/linux/install/ubuntu/0-menu.sh && sudo configurations/linux/install/ubuntu/0-menu.sh $USER $HOME
