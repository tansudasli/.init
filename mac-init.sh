# homebrew: package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# common
xcode-select --install
brew install curl
brew install wget

# oh-my-zsh - a better terminal and shell(=zsh) !
# iTerm -> tmux -> zsh | plugins -> oh-my-zsh -> fonts | colors
# add ssh prompts in theme files!
# fonts - set in iTerm settings | import the .itermcolor file
brew install --cask iterm2
brew install zsh zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp pi.zsh-theme $ZSH_CUSTOM/themes/pi.zsh-theme
cp .zshrc ~/

wget -O Downloads/dimmedmonokai https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/DimmedMonokai.itermcolors
wget -O Downloads/dracula+ https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Dracula+.itermcolors



# SDKs: java, nodejs, pyhton3
# install sdkman to handle java sdk! do not use brew!
# sdk install java to find latest versions

curl -s "https://get.sdkman.io" | bash

sdk install java 23.0.1-graal
sdk install java 23.0.1-graalce
sdk install java 23-open
sdk install java 25.ea.5-open

###############
brew install node           # manage js packages w/ npm

brew install --cask anaconda  # manage python packages w/ conda
echo 'export PATH="/usr/local/anaconda3/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

conda init zsh                              # <SHELL_NAME> can be bash, zsh …. Then restart terminal
conda config --add channels conda-forge     # add conda-forge channel for new repository

conda env list
# create a new env.
conda create --name opencv python=3
conda activate opencv
conda install -c conda-forge opencv
conda deactivate opencv

# conda environments, for spark ...
echo 'export LC_ALL=en_US.UTF-8' >> ~/.zshrc
echo 'export LANG=en_US.UTF-8' >> ~/.zshrc

source ~/.zshrc

brew install go

# productivity
brew install --cask google-chrome # open chrome and login w/ google account, sync will be started and takes time
brew install --cask whatsapp

# IDEs: vscode & intellij
brew install --cask visual-studio-code
brew install --cask jetbrains-toolbox   #use toolbox to install intellij, goland etc...

# create your coding directory. use for all git clone ...
mkdir ~/coding
mkdir ~/Downloads/ISO

# some settings in intellij
#- activate intellij w/ jb account (activates all products)
#- enter prereferences at intellij, then search github, add account w/ token. 
#  regreate the token in github. and define in intellij/goland/ ...etc

brew install --cask virtualbox
brew install --cask virtualbox-extension-pack

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


#CLIs
# run gcloud init to configure gcp cli
brew install --cask google-cloud-sdk
brew install awscli
brew install azure-cli


echo "source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'"  >> ~/.zshrc
echo "source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'"  >> ~/.zshrc
source ~/.zshrc

# to configure gcp, default project/region/zone
# run as many as u want, if u need to add more accounts! .)
gcloud init 

# dart
brew tap dart-lang/dart
brew install dart

# nodejs
sudo npm i -g typescript ts-node
sudo npm i -g @angular/cli
sudo npm i -g nodemon
sudo npm i -g firebase-tools   # firebase
sudo npm i -g marked
sudo npm i -g workbox-cli      # service worker generation
sudo npm i -g cli-real-favicon # favicon/mstile/android/appletouch generation
sudo npm i -g parcel-bundler   # run typescript code in browser directly

# install xcode from apple-app-store !!! for flutter, u need it ..

brew tap MiderWong/flutter
brew install flutter
echo 'export PATH="/usr/local/opt/flutter/bin:$PATH"' >> ~/.zshrc
flutter config --no-analytics
flutter doctor

#  UI/UX
brew install --cask sketch   #then enter license key
brew install --cask sketch-toolbox
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

# add an alies: git logs
git config --global alias.logs "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# some utilities 
brew install watch  # watch -n 0.2 curl .... to run continuously

# openstack
brew install --cask balenaetcher #make bootable usbs from iso file

#embedded 
brew install gcc   #c,c++ compiler
brew install cmake #cmake compiler

# torrent download cli
brew install aria2
