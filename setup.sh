#!/bin/bash

sudo pacman -Sy
sudo pacman -Sy base-devel yaourt pacaur curl dnsutils

echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="users", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="f1d0"' | sudo tee /etc/udev/rules.d/10-security-key.rules

pacaur -Sy yarn docker git google-chrome yubikey-manager yubikey-personalization libu2f-host 
yubikey-personalization-gui-git vivaldi kubectl minikube zsh visual-studio-code-bin spotify 
slack-desktop insomnia telepresence-git

sudo systemctl enable pcscd.service

bash ~/git/personal/dotfiles/symlink-setup.sh

sudo chsh -s $(which zsh) $USER

# Docker
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
sudo systemctl start docker

# Minikube
# http://blog.programmableproduction.com/2018/03/08/Archlinux-Setup-Minikube-using-KVM/
sudo pacman -Sy libvirt qemu-headless ebtables dnsmasq docker-machine
sudo systemctl enable libvirtd.service
sudo systemctl enable virtlogd.service
yaourt -Sy docker-machine-driver-kvm2  

# KVM nested virt
modprobe -r kvm_intel
echo "options kvm_intel nested=1" | sudo tee -a /etc/modprobe.d/kvm.conf

# GPG2 settings
cat >> ~/.gnupg/gpg-agent.conf << EOF
default-cache-ttl 600
max-cache-ttl 7200
enable-ssh-support
write-env-file
EOF

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

echo "Run gpg2 --card-edit"
echo "Then in the interactive terminal run 'fetch'"