

#partitioning (lvm, backup, data...)
#hostname (depends on how to use: jumpbox or development-machine)
#users ( admin, ansible ..)
#openssh-server

sudo apt update 
sudo apt upgrade -y

# zsh + oh-my-zsh
# change .zshrc file PLUGIN section
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#then, edit .zshrc PLUGIN section !!
(zsh-autosuggestions zsh-syntax-highlighting)
#then, to see localhost name in terminal and ssh, add below lines to ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
local hostname="%{$fg_bold[black]%}%m"
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${hostname} ${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# customizations
# search some keywords solid calor desktop; bottom dock; size etc...
sudo apt-get install dconf-editor      
sudo apt install gnome-tweaks               #then, install dashtodock gnome extention
sudo apt install gnome-shell-extensions

sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install numix-icon-theme-circle    #then, gnome-tweak/appearance/icons


#
sudo apt install ari2c -y     #torrent downloader cli 
sudo apt install htop -y 
sudo apt install nmap -y      #network hack 
sudo apt install locate -y     #indexed search
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb

#coding
sudo apt install openjdk-17-jdk golang gcc cmake ansible

# install conda
aria2c -c -x3 -j3 https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh
bash Anaconda3-2021.11-Linux-x86_64.sh #anaconda3/bin/conda init zsh

snap install google-cloud-sdk --classic  #gcloud init

# create your coding directory. use for all git clone ...
mkdir ~/coding
mkdir ~/Downloads/iso

source ~/.zshrc

# kvm + libvirt
# use virt-manager (ui), sudo virsh (cli)
# install a base ubuntu image, and clone when necessary
# download ubuntu server iso, alpine linux iso, truenas/scale iso with aria2c
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
sudo adduser $USERNAME libvirt

sudo apt install libguestfs-tools -y  #virt-sysprep for cloning cli
sudo apt install libnss-libvirt -y    #to ssh w/ hostnames, also update /etc/nsswitch.conf !! or use
                                      #virsh domifaddr NAME or virsh net-dhcp-.. default or arp -an     
#sudo nano /etc/libvirt/libvirt.conf  #edit uri_default conn, sudo virsh can see same as virt-manager

#multipass
sudo snap install multipass
snap connect multipass:libvirt           #to see same as virt-manager
sudo multipass set local.driver=libvirt