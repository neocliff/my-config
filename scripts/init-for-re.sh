#!/bin/sh

# this script automates a bunch of installation items for creating the
# vm's use for reverse engineering binaries.

sudo apt-get install -y gcc
sudo apt-get install -y cmake
sudo apt-get install -y tmux
sudo apt-get install -y ssh
sudo apt-get install -y git
sudo apt-get install -y wine-stable

# generate the key for git
cd ~
echo "running ssh-key to create a new id_rsa and id_rsa.pub..."
ssh-keygen -t rsa -b 4096 -C "neocliff@mac.com"

echo "starting ssh-agent..."
eval "$(ssh-agent -s)"

echo "adding id_rsa to ssh-agent..."
ssh-add ~/.ssh/id_rsa


