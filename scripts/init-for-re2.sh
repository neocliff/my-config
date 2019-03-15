#!/bin/sh

# this script automates a bunch of installation items for creating
# a system to use for reverse engineering binaries.

# install programming languages support
sudo apt-get install -y gcc g++
sudo apt-get -y nasm
sudo apt-get install -y cmake
sudo apt-get install -y python3-pip
sudo apt-get install -y pylint
sudo apt-get install -y build-essential

# we are always going to be making virtual machines for things
sudo apt-get install -y virtualbox-qt
sudo apt-get install -y qemu

# tmux is a terminal multiplexer; much nicer than 47 terminal windows
sudo apt-get install -y tmux

# wine provides the windows system api's that translate windows calls
# to linux calls
sudo apt-get install -y wine-stable

# install a fuzzer
sudo apt-get install -y zzuf

# install OpenJDK 11 JDK
sudo apt-get install openjdk-11-jdk

# do a final update/upgrade
sudo apt update
sudo apt upgrade

# remove any unneeded flotsam in the system
sudo apt autoremove
