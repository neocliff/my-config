#!/bin/sh

# this script automates a bunch of installation items for creating
# a system to use for reverse engineering binaries.

# install compilers and interpreters and such
#     note that build-essential gives you gcc, g++, as, etc
sudo apt install -y build-essential
sudo apt install -y nasm
sudo apt install -y cmake
sudo apt install -y python-pip
sudo apt install -y python3-pip
sudo apt install -y pylint

# we are always going to be making virtual machines for things
sudo apt install -y virtualbox-qt
sudo apt install -y qemu

# we might want to use containers as well.
sudo apt install docker.io

# tmux is a terminal multiplexer; much nicer than 47 terminal windows
sudo apt install -y tmux

# install various editors
sudo apt install -y vim
sudo apt install -y bless

# wine provides the windows system api's that translate windows calls
# to linux calls. you only need this if you want to RE windows binaries
# on a linux platform.
sudo apt install -y wine-stable

# install a fuzzer
sudo apt install -y zzuf

# install OpenJDK 11 JDK. note that this only gets you JDK 11 on an
# ubuntu 18.10 system. if you do this on an ubuntu 18.04 system you
# get JDK 10 instead. you have been warned!
sudo apt install -y openjdk-11-jdk

# do a final update/upgrade
sudo apt update
sudo apt upgrade

# remove any unneeded flotsam in the system
sudo apt autoremove
