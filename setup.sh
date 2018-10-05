#!/bin/bash

sudo pacman -Sy
sudo pacman -Sy base-devel yaourt pacaur curl

echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="users", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="f1d0"' | sudo tee /etc/udev/rules.d/10-security-key.rules

pacaur -Sy yarn docker git google-chrome yubikey-manager yubikey-personalization libu2f-host 
yubikey-personalization-gui-git vivaldi kubectl minikube zsh visual-studio-code-bin spotify 
slack-desktop insomnia

sudo systemctl enable pcscd.service

bash ~/git/personal/dotfiles/symlink-setup.sh

sudo chsh -s $(which zsh) $USER

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