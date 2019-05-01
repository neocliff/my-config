#!/bin/bash

# Basic Setup
echo "!! CREATING ~/Projects/Tools"
mkdir temp
mkdir ~/Projects
mkdir ~/Projects/Tools

# Add Repos
echo "!! ADDING REPOS !!"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - 
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository ppa:openjdk-r/ppa
sudo add-apt-repository ppa:kelleyk/emacs
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Remove Bad Packages First
echo "!! REMOVING BAD PACKAGES !!"
sudo apt-get remove docker docker-engine docker.io containerd runc

# Setup https sources
echo "!! SETTING UP HTTPS SOURCES"
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Basic Update
echo "!! PERFORMING UPGRADE !!"
sudo apt update && sudo apt upgrade

# Install APTs
echo "!! INSTALLING APTS !!"
sudo apt -y install gcc build-essential checkinstall linux-headers-$(uname -r) # Essientials
sudo apt -y install snapd git vim sublime-text make cmake python python3 python-pip python3-pip docker-ce docker-ce-cli containerd.io \
    gcc g++ gdb pylint qtcreator qt5-default p7zip-full openjdk-11-jdk openjdk-8-jdk emacs26

# Install Snaps
echo "Install Snaps (Y/n)?"
read userInput

if [ "$userInput" = "Y" ] || [ "$userInput" = "y" ] ; then
    echo "!! INSTALLING SNAPS !!"
    sudo snap install pycharm-community --classic
    sudo snap install intellij-idea-community --classic
    sudo snap install clion --classic
    sudo snap install --classic eclipse
    sudo snap install netbeans --classic
    echo "Snaps Installed"
else
    echo "Skipping Snaps"
fi

# Install NodeJS && NPM
echo "!! INSTALLING NODEJS & NPM !!"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get -y install nodejs

# Install VSCode
echo "!! INSTALLING VSCODE !!"
wget https://az764295.vo.msecnd.net/stable/a3db5be9b5c6ba46bb7555ec5d60178ecc2eaae4/code_1.32.3-1552606978_amd64.deb
mv code*.deb ./temp/code.deb
sudo apt -y install ./temp/code.deb

# Install VSCode Plugins
echo "!! INSTALLING VSCODE PLUGINS !!"
code --install-extension ms-vscode.cpptools
code --install-extension ms-python.python
code --install-extension vscode-icons-team.vscode-icons

# Install SpaceMacs
echo "!! INSTALLING SPACEMACS !!"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Add googletest
echo "!! INSTALLING GOOGLETEST !!"
git clone https://github.com/google/googletest.git ~/Projects/Tools/GTest

# Install Ghidra
echo "Download Ghidra (Y/n)?"
read userInput

if [ "$userInput" = "Y" ] || [ "$userInput" = "y" ] ; then
    echo "!! DOWNLOADING GHIDRA !!"
    wget https://ghidra-sre.org/ghidra_9.0.1_PUBLIC_20190325.zip &&
    mv ghidra*.zip temp/ghidra.zip &&
    7z x ./temp/ghidra.zip -o./temp/ghidra
    mv ./temp/ghidra ~/Projects/Tools/
    echo "Ghidra Downloaded!"
else
    echo "Skipping Ghidra"
fi

# Install PWNDBG
echo "!! INSTALLING PWNDBG !!"
git clone https://github.com/pwndbg/pwndbg ./temp/pwndbg
cd ./temp/pwndbg/
./setup.sh 
cd ../..

# Install elfparser
echo "!! INSTALLING ELFPARSER !!"
wget http://elfparser.com/release/elfparser_x86_64_1.4.0.deb &&
mv elfparser*.deb temp/elfparser.deb
sudo dpkg -i temp/elfparser.deb

echo "!! CLEANING UP !!"
rm -rf temp/


echo "Created ~/Projects... folder contains tools and such."
echo "Press enter to exit"
read

