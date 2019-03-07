#!/bin/sh

# this script automates a bunch of installation items for creating the
# vm's use for reverse engineering binaries.

# install programming languages support
sudo apt-get install -y gcc g++
sudo apt-get -y nasm
sudo apt-get install -y cmake
sudo apt-get install -y python3-pip

# tmux is a terminal multiplexer; much nicer than 47 terminal windows
sudo apt-get install -y tmux

# on ubuntu systems, ssh is only the client side; to be able to ssh
# into the system, you have to install the server side
sudo apt-get install -y ssh
sudo apt-get install -y git

# wine provides the windows system api's that translate windows calls
# to linux calls
sudo apt-get install -y wine-stable

# install a fuzzer
sudo apt-get install -y zzuf
