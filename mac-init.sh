# homebrew: package manager
# manual installation for [virtualbox, virtualbox-extension-pack, sdkman, sketch 91.4, sketch-toolbox ...]
# use npm package manager for js things [ts, angular, firebase ...]
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# common
#brew install --cask balenaetcher # make bootable usbs from iso file
xcode-select --install # mac development cli: clang etc...
brew install curl
brew install wget
brew install watch     # watch -n 0.2 curl .... to run continuously
brew install aria2     # torrent download cli
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

# IDEs: vscode & intellij
# brew install --cask jetbrains-toolbox [2023.x license]
# 
# vscode, settings synced [terminal (app,font...), plugins, themes ...]
# vscode-github account auth.
brew install --cask visual-studio-code

# SDKs: java, nodejs, pyhton3

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
brew install cmake    # build tool for C, C++

# create your coding directory. 
# download from repository by git clone ...
mkdir ~/coding
mkdir ~/Downloads/ISO


# virtualization
# virtualbox, docker
# >> download virtualbox from virtualbox.org

# docker
# after opening docker UI, login w/ docker id (or create) or run `docker login`
# > configure kubectl for a remote k8 cluster. `gcloud container clusters get-credentials $CLUSTER_NAME` will do the job,
# if you have a GKE cluster on gcp!
# > add helm repo for chart repos
brew install --cask docker     #docker desktop, cli
brew install kubectl           #kubectl commands
brew install helm              #k8 package manager + cluster manager
brew install kompose           #convert docker-compose.yaml to k8s   


helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# below is just a hint. runing kubernetes or minicube is not meaningful on local!!
# so u need to define remote kubernetes engine
# Read if you need ---> configure GKE cluster to access from your local machine: https://kubernetes.io/docs/tasks/tools/install-kubectl/"


#cloud provider CLIs
#run gcloud init to configure gcp, default project/region/zone
# run as many as u want, if u need to add more accounts! .)
brew install --cask google-cloud-sdk

gcloud init 


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

# ansible
# use ~/.ansible as home
# create seperate inventory file and set in ansible command always
# use service account private key
brew install ansible


# ethereum & blockchain
npm install -g truffle
npm install -g ganache-cli









