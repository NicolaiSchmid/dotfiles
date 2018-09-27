#!/bin/bash

sudo pacman -Sy
sudo pacman -Sy base-devel yaourt snapd pacaur

sudo systemctl enable --now snapd.socket

sudo ln -s /var/lib/snapd/snap /snap

sudo snap install spotify insomnia vlc
sudo snap install vscode --classic
sudo snap install slack --classic

echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="users", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="f1d0"' | sudo tee /etc/udev/rules.d/10-security-key.rules

pacaur -Sy yarn docker nvm git google-chrome yubikey-manager yubikey-personalization libu2f-host yubikey-personalization-gui-git vivaldi kubectl minikube zsh

sudo systemctl enable pcscd.service

bash ~/git/personal/dotfiles/symlink-setup.sh

# Import public key of the yubikey-key
gpg --import < curl https://keybase.io/nicolaischmid/key.asc

sudo chsh -s $(which zsh) $USER



