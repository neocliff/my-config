#!/bin/sh

echo "installing kde plasma packages..."
sudo apt-get -y install tasksel
sudo tasksel install kubuntu-desktop
sudo apt install sddm
wait

echo "reconfiguring sddm..."
sudo dpkg-reconfigure sddm

echo "done. reboot to finish the switch."
