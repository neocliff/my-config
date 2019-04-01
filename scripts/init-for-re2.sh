#!/bin/sh

# this script automates a bunch of installation items for creating
# a system to use for reverse engineering binaries.

# install compilers and interpreters and such
#     note that build-essential gives you gcc, g++, as, etc
echo "installing compilers, assemblers, and language tools..."
sudo apt install -y build-essential
sudo apt install -y nasm
sudo apt install -y cmake
sudo apt install -y python-pip
sudo apt install -y python3-pip
sudo apt install -y pylint
sudo apt install -y git

# we are always going to be making virtual machines for things
echo "installing virtualization and containerization features..."
sudo apt install -y virtualbox-qt
sudo apt install -y qemu
sudo apt install docker.io

# tmux is a terminal multiplexer; much nicer than 47 terminal windows
echo "installing tmux..."
sudo apt install -y tmux

# install various editors
echo "installing the editors..."
sudo apt install -y vim
sudo apt install -y bless
sudo apt install -y emacs

# wine provides the windows system api's that translate windows calls
# to linux calls. you only need this if you want to RE windows binaries
# on a linux platform.
echo "installing wine..."
sudo apt install -y wine-stable

# install a fuzzer
echo "installing the fuzzers..."
sudo apt install -y zzuf

# install elfparser, a gui-based tool for examining/editing ELF binaries.
# note i assume you are wanting the x86_64 version. if you want the x86
# version, comment out the x86_64 versions and uncomment the i686 packages.
echo "grabbing and installing the \'elfparser\' tools...."
wget http://elfparser.com/release/elfparser_x86_64_1.4.0.deb --output-document=./elfparser_x86_64_1.4.0.deb
sudo dpkg -i ./elfparser_x86_64_1.4.0.deb
#wget http://elfparser.com/release/elfparser_i686_1.4.0.deb --output-document=./elfparser_i686_1.4.0.deb
#sudo dpkg -i ./elfparser_i686_1.4.0.deb
#wget http://elfparser.com/release/elfparser-cli_i686_1.4.0.deb --output-document=./elfparser-cli_i686_1.4.0.deb
#sudo dpkg -i ./elfparser-cli_i686_1.4.0.deb

# install Microsoft's VS Code
echo "installing vs vode..."
wget https://update.code.visualstudio.com/1.32.3/linux-deb-x64/stable --output-document=./code-stable.deb
sudo dpkg -i ./code-stable.deb

echo "downloading and installing extensions..."
code --install-extension ms-vscode.cpptools
code --install-extension ms-python.python
code --install-extension vscjava.vscode-java-debug
code --install-extension vscjava.vscode-java-dependency
code --install-extension vscjava.vscode-java-pack
code --install-extension vscjava.vscode-java-test
code --install-extension redhat.java
code --install-extension vscjava.vscode-maven
code --install-extension twxs.cmake
code --install-extension go2sh.cmake-integration-vscode
code --install-extension vector-of-bool.cmake-tools
code --install-extension maddouri.cmake-tools-helper
code --install-extension mhutchie.git-graph
code --install-extension eamodio.gitlens
code --install-extension vscodevim.vim
code --install-extension VisualStudioExptTeam.vscodeintellicode

# how about the Sublime text exitor?
echo "installing Sublime text editor..."
sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# install OpenJDK 11 JDK. note that this only gets you JDK 11 on an
# ubuntu 18.10 system. if you do this on an ubuntu 18.04 system you
# get JDK 10 instead. you have been warned!
echo "installing OpenJDK 11..."
sudo apt install -y openjdk-11-jdk

# do a final update/upgrade
echo "doing final updates..."
sudo apt update
sudo apt upgrade

# remove any unneeded flotsam in the system
echo "cleaning up the flotsam..."
sudo apt autoremove

echo "done!"
