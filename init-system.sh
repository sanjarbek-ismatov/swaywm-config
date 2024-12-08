#!/bin/bash
# DNF configuration
# echo "Configuring DNF..."
# sudo bash -c 'cat > /etc/dnf/dnf.conf <<EOF
# [main]
# gpgcheck=1
# installonly_limit=3
# clean_requirements_on_remove=True
# best=False
# skip_if_unavailable=True
# fastestmirror=1
# max_parallel_downloads=10
# deltarpm=true
# defaultyes=true
# EOF'

# Previous code:

# sudo echo "[main] 
# gpgcheck=1 
# installonly_limit=3 
# clean_requirements_on_remove=True 
# best=False 
# skip_if_unavailable=True 
# fastestmirror=1 
# max_parallel_downloads=10
# deltarpm=true
# defaultyes=true" > /etc/dnf/dnf.conf


# RPM Fusion
echo "Installing RPM Fusion..."
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf update @core

# Firmware updates
echo "Firmware updates are being checked..."
sudo fwupdmgr refresh --force
sudo fwupdmgr get-devices # Lists devices with available updates.
sudo fwupdmgr get-updates # Fetches list of available updates.
sudo fwupdmgr update


# Codecs
echo "Multimedis Codecs are installing..."
sudo dnf swap ffmpeg-free ffmpeg --allowerasing # Switch to full FFMPEG.
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin # Installs gstreamer components. Required if you use Gnome Videos and other dependent applications.

# sudo dnf update @sound-and-video # Installs useful Sound and Video complement packages.
# sudo dnf install Multimedia

# HW acceleration
echo "HW acceleration"
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686
sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686
sudo dnf install -y ffmpeg-libs libva libva-utils
sudo dnf install -y openh264 gstreamer1-plugin-openh264 mozilla-openh264


# Time

sudo timedatectl set-local-rtc '0'


# Battery saving

echo "Battery saving"
sudo dnf install -y tlp tlp-rdw
sudo systemctl enable tlp.service
sudo tlp start
# cat << EOF | sudo tee /etc/systemd/system/powertop.service
# [Unit]
# Description=PowerTOP auto tune

# [Service]
# Type=oneshot
# Environment="TERM=dumb"
# RemainAfterExit=true
# ExecStart=/usr/sbin/powertop --auto-tune

# [Install]
# WantedBy=multi-user.target
# EOF

# systemctl daemon-reload
# systemctl enable powertop.service
