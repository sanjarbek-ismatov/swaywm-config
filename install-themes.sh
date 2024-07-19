#!/usr/bin/bash
echo "Orchis theme"
git clone https://github.com/vinceliuice/Orchis-theme.git ~
cd ~/Orchis-theme && ./install.sh --tweaks black solid

echo "Materia theme" 
sudo dnf install materia-gtk-theme materia-kde

# icon
echo "Tela icon theme"
git clone https://github.com/vinceliuice/Tela-icon-theme.git ~
cd ~/Tela-icon-theme && ./install.sh
# Flatpak
echo "Applying themes for flatpak apps"
# Use if you have flatpak

# flatpak override --user --filesystem=xdg-config/gtk-4.0
# sudo flatpak override --filesystem=xdg-config/gtk-4.0