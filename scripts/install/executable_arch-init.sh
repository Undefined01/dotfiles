#!/bin/sh -e

pacman -S --needed --noconfirm openssh
sed -i -E '/PasswordAuthentication (no|yes)$/c\PasswordAuthentication no' /etc/ssh/sshd_config
systemctl enable sshd
systemctl start sshd


(cat /etc/group | grep sudo) || groupadd sudo
(id -nG $(whoami) | grep -qw sudo) || usermod -a -G sudo lh
sed -i -E '/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/c\%sudo ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers

pacman -S --needed --noconfirm intel-ucode
pacman -S --needed --noconfirm adobe-source-code-pro-fonts adobe-source-sans-fonts adobe-source-serif-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts firefox
pacman -S --needed --noconfirm xfce4 xfce4-systemload-plugin
pacman -S --needed --noconfirm fcitx5-im fcitx5-rime

pacman -S --needed --noconfirm zsh wget curl vi vim git tldr zip unzip dust ripgrep jq fzf mcfly
pacman -S --needed --noconfirm ntfs-3g
pacman -S --needed --noconfirm p7zip tumbler ffmpegthumbnailer parole gst-libav

