#!/bin/sh -e

source $(dirname $0)/../utils.sh

pacman -S --needed --noconfirm intel-ucode
pacman -S --needed --noconfirm adobe-source-code-pro-fonts adobe-source-sans-fonts adobe-source-serif-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts firefox
pacman -S --needed --noconfirm xfce4 xfce4-systemload-plugin
pacman -S --needed --noconfirm fcitx5-im fcitx5-rime

pacman -S --needed --noconfirm zsh wget curl vim git tldr dust ripgrep jq mcfly
pacman -S --needed --noconfirm ntfs-3g
pacman -S --needed --noconfirm p7zip tumbler ffmpegthumbnailer parole gst-libav

