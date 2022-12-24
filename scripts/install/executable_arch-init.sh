#!/bin/sh -e

source $(dirname $0)/../utils.sh

pacman -S --needed --noconfirm intel-ucode
pacman -S --needed --noconfirm adobe-source-code-pro-fonts adobe-source-sans-fonts adobe-source-serif-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts firefox
pacman -S --needed --noconfirm xfce4 xfce4-systemload-plugin
pacman -S --needed --noconfirm fcitx5-im fcitx5-rime rime-luna-pinyin rime-double-pinyin rime-emoji

pacman -S --needed --noconfirm zsh wget curl vi vim git tldr bottom dust ripgrep jq
pacman -S --needed --noconfirm ntfs-3g


