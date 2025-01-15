# 3 main categories [OS | Coding | Virtualization] 
#
#
# homebrew: package manager
# manual installation for [virtualbox, virtualbox-extension-pack, sdkman, sketch 91.4, sketch-toolbox ...]
# use npm package manager for js things [ts, angular, firebase ...]
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# common
#brew install --cask balenaetcher # make bootable usbs from iso file
xcode-select --install # mac development cli: clang etc...
brew install htop
brew install nvtop
brew install curl
brew install wget
brew install watch     # watch -n 0.2 curl .... to run continuously
brew install aria2     # torrent download cli => aria2c -j 3 -s 3 --listen-port=6951-6970 -T ubuntu-24.10-desktop-amd64.iso.torrent
brew install --cask google-chrome
brew install --cask whatsapp

# oh-my-zsh - a better terminal and shell(=zsh) !
# iTerm -> tmux -> zsh | plugins -> oh-my-zsh -> fonts | colors
# add ssh prompts in theme files!
# fonts - set in iTerm settings | import the .itermcolor file
brew install --cask iterm2
brew install zsh zsh-syntax-highlighting zsh-autosuggestions

cp pi.zsh-theme $ZSH_CUSTOM/themes/pi.zsh-theme
cp .zshrc ~/

wget -O Downloads/dimmedmonokai https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/DimmedMonokai.itermcolors
wget -O Downloads/dracula+ https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Dracula+.itermcolors

source .zshrc

# ansible
# use ~/.ansible as home
# create seperate inventory file and set in ansible command always
# use service account private key
brew install ansible

#cloud provider CLIs
# > create gcp account
#run gcloud init to configure gcp, default project/region/zone
#run as many as u want, if u need to add more accounts! .)
brew install --cask google-cloud-sdk

gcloud init 

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
brew install --cask visual-studio-code

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

brew install --cask miniconda    
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
brew install go

#C, C++
#cLang is preferable for Mac
brew install gcc      # c,c++ compiler
brew install cmake    # build manager for C, C++


# nodejs
# npm: package manager for js packages
brew install node 

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
brew install dart-sdk

brew install --cask flutter
flutter config --no-analytics
flutter doctor

# UI/UX
# download sketch, sketch tool box
# enter licences
# install plugins
brew install --cask sketch@91.4
brew install --cask skyfonts

# install material.sketch (Baseline.sketch) plugin 
# READ -> https://support.google.com/materialgallery/answer/9270373?hl=en
# curl -O https://material.io/tools/theme-editor/downloads/production/material.sketchplugin.zip


# ethereum & blockchain
npm install -g truffle
npm install -g ganache-cli

# ****** virtualization *******

# virtualbox
# >> download virtualbox from virtualbox.org
# >> download virtualbox extension pack and configure in virtualbox app.

# docker
# > create docker hub account
brew install --cask docker     #docker desktop & cli

docker login

# k8s
# > configure kubectl for a remote k8 cluster (i.e k8s cluster on gcp). `gcloud container clusters get-credentials $CLUSTER_NAME` will do the job,
#brew install kubectl           #kubectl commands
#brew install kompose           #convert docker-compose.yaml to k8s   
#brew install helm              #k8 package manager + cluster manager

#helm repo add stable https://kubernetes-charts.storage.googleapis.com/


# below is just a hint. runing kubernetes or minicube is not meaningful on local!!
# so u need to define remote kubernetes engine
# Read if you need ---> configure GKE cluster to access from your local machine: https://kubernetes.io/docs/tasks/tools/install-kubectl/"



