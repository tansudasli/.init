# 3 main categories [OS | Coding | Virtualization] 
#
#
# 
# to upgrade OS
#sudo do-release-upgrade
sudo apt update && upgrade -y

# common
#brew install --cask balenaetcher # make bootable usbs from iso file
#
sudo apt install apt-transport-https ca-certificates gnupg
sudo apt install curl wget watch aria2 htop nvtop nmap locate git -y


wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
     && sudo dpkg -i google-chrome-stable_current_amd64.deb


#sudo snap install whatsapp-linux-app

# oh-my-zsh - a better terminal and shell(=zsh) !
# iTerm -> tmux -> zsh | plugins -> oh-my-zsh -> fonts | colors
# add ssh prompts in theme files!

sudo apt install zsh # then logout and login again
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

cd coding/.init
cp pi.zsh-theme $ZSH_CUSTOM/themes/pi.zsh-theme
cp .zshrc ~/

# > install Nerd fonts

source ~/.zshrc

# ansible
# use ~/.ansible as home
# create seperate inventory file and set in ansible command always
# use service account private key
sudo apt install ansible -y

#cloud provider CLIs
# > create gcp account
#run gcloud init to configure gcp, default project/region/zone
#run as many as u want, if u need to add more accounts! .)
sudo snap install google-cloud-cli --classic

gcloud init 

# customizations
# set solid color for backgroung
# set touchpad gestures
sudo apt-get install dconf-editor # search some keywords solid calor desktop : org.gnome.desktop.background=#ffbd31; 
sudo apt install gnome-tweaks gnome-shell-extensions gnome-shell-extension-manager touchegg # open extention-manager, install x11 gestures

# shortcuts
# in terminal, change copy and paste shortcuts (remove shift+ key)
# in settings/keyboards, change search as windows+space (like macos)

# ****** coding ***************

# create your coding directory. 
# download from repository by git clone ...
mkdir ~/coding
mkdir ~/Downloads/ISO

# IDEs: vscode & intellij
# brew install --cask jetbrains-toolbox [2023.x license]
# 
# vscode, settings synced [terminal (app=iTerm.app,font.size=13...), window.zoomLevel=0.5, editor.font.size=13, plugins, themes ...]
# vscode-github account auth.
sudo snap install code --classic

# SDKs: C/C++, java, nodejs, pyhton3, dart, flutter, ts, golang

# java
# sdkman: package manager to handle java sdk
# sdk install java [graalce & open's last stable, open's early-access]
curl -s "https://get.sdkman.io" | bash

sdk install java 23.0.1-graalce
sdk install java 23-open
sdk install java 25.ea.5-open 

brew install gradle    # build manager for java

# python
# conda: package manager for python packages
# add conda-forge as repository
# create environments
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
     && bash Miniconda3-latest-Linux-x86_64.sh
  
conda init "$(basename "${SHELL}")"
conda config --add channels conda-forge

# create env list using conda.env.list
#cat conda.env.list
#conda env list
#conda create --name opencv python=3
#conda activate opencv
#conda install -c conda-forge opencv
#conda deactivate opencv

#golang
sudo apt install golang

#C, C++
#cLang is preferable for Mac
sudo apt install gcc      # c,c++ compiler
sudo apt install cmake    # build manager for C, C++


# nodejs
# npm: package manager for js packages
brew install nodejs 

sudo npm i -g typescript ts-node
sudo npm i -g @angular/cli     # angular 
sudo npm i -g nodemon
sudo npm i -g firebase-tools   # firebase
sudo npm i -g marked
sudo npm i -g workbox-cli      # service worker generation
sudo npm i -g cli-real-favicon # favicon/mstile/android/appletouch generation
sudo npm i -g parcel-bundler   # run typescript code in browser directly


# flutter
# dart


# UI/UX
# download sketch, sketch tool box
# enter licences
# install plugins


# install material.sketch (Baseline.sketch) plugin 
# READ -> https://support.google.com/materialgallery/answer/9270373?hl=en
# curl -O https://material.io/tools/theme-editor/downloads/production/material.sketchplugin.zip


# ethereum & blockchain
#

# ****** virtualization *******

# KVM + libvirt
# virt-manager (ui for all) or virt-install (cli only for vm creation)
# sudo virsh   (cli for all) 
# virt-sysprep (cli for cloning)
# install a base ubuntu image, and clone when necessary

sudo apt install qemu qemu-kvm \
                 libvirt-daemon-system libvirt-clients \
                 bridge-utils  \
                 cpu-checker   \
                 virt-manager  \
                 libguestfs-tools     #virt-sysprep for cloning cli

sudo adduser $USERNAME libvirt
sudo adduser $USERNAME kvm

#to ssh w/ hostnames, also update /etc/nsswitch.conf !! or use
#virsh domifaddr NAME or virsh net-dhcp-.. default or arp -an     
sudo apt install libnss-libvirt -y   

# > edit uri_default conn, so
#virsh can see same as virt-manager
#sudo nano /etc/libvirt/libvirt.conf  

#sudo systemctl status libvirtd       #check virt. deamon status


#multipass
#easily create ubuntu images instead of cloning or installin manually
#sudo snap install multipass
#snap connect multipass:libvirt       #to see same as virt-manager
#sudo multipass set local.driver=libvirt

# docker
# > create docker hub account
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
     $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update \
     && docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER

docker login

#disable auto start on boot
sudo systemctl disable docker.service
sudo systemctl disable containerd.service

# k8s
# > configure kubectl for a remote k8 cluster (i.e k8s cluster on gcp). `gcloud container clusters get-credentials $CLUSTER_NAME` will do the job,
#... install kubectl           #kubectl commands
#... install kompose           #convert docker-compose.yaml to k8s   
#... install helm              #k8 package manager + cluster manager

#helm repo add stable https://kubernetes-charts.storage.googleapis.com/


# below is just a hint. runing kubernetes or minicube is not meaningful on local!!
# so u need to define remote kubernetes engine
# Read if you need ---> configure GKE cluster to access from your local machine: https://kubernetes.io/docs/tasks/tools/install-kubectl/"



