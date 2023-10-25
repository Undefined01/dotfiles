#!/bin/sh -e

# network
pacman -S --needed --noconfirm networkmanager
systemctl enable NetworkManager
systemctl start NetworkManager
# nmtui

# basic settings
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
sed -e '/zh_CN.UTF-8 UTF-8/c\zh_CN.UTF-8 UTF-8' -e '/en_US.UTF-8 UTF-8/c\en_US.UTF-8 UTF-8' -i /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo Han-Portable > /etc/hostname

timedatectl set-local-rtc true
timedatectl set-ntp true

pacman -S --needed --noconfirm intel-ucode amd-ucode

# openssh
pacman -S --needed --noconfirm openssh
sed -i -E '/PasswordAuthentication (no|yes)$/c\PasswordAuthentication no' /etc/ssh/sshd_config
systemctl enable sshd
systemctl start sshd

# user
USER=lh
useradd --groups $USER --create-home $USER

# for wsl
./Arch.exe config --default-user $USER
pacman-key --init
pacman-key --populate
pacman -Sy --noconfirm archlinux-keyring
pacman -Su

# mirror
sed -e '1iServer = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' -i /etc/pacman.d/mirrorlist
sed -e '/ParallelDownloads/c\ParallelDownloads = 16' -i /etc/pacman.conf

# sudo
SUDOGROUP=wheel
pacman -S --needed --noconfirm sudo
(cat /etc/group | grep $SUDOGROUP) || groupadd $SUDOGROUP
(id -nG $USER | grep -qw $SUDOGROUP) || usermod -a -G $SUDOGROUP $USER
echo "%$SUDOGROUP ALL=(ALL) ALL" > /etc/sudoers.d/$SUDOGROUP
# sed -i -E '/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/c\%sudo ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers

# cli
pacman -S --needed --noconfirm wget curl vi vim openssh git less python man tar zip unzip p7zip zstd psmisc
pacman -S --needed --noconfirm zsh fish git-delta exa bat tldr dust ripgrep fd jq fzf glances zoxide

# bluetooth
pacman -S --needed --noconfirm blueman
systemctl enable bluetooth
systemctl start bluetooth

# tmux
pacman -S --needed --noconfirm zellij

# ntfs
pacman -S --needed --noconfirm ntfs-3g

# xfce
pacman -S --needed --noconfirm pipewire-jack wireplumber noto-fonts
pacman -S --needed --noconfirm xorg xfce4 xfce4-goodies xfce4-systemload-plugin lightdm
systemctl enable lightdm

# plasma
pacman -S --needed --noconfirm pipewire-jack wireplumber phonon-qt5-vlc pyside2 cronie
pacman -S --needed --noconfirm xorg plasma kde-applications
systemctl enable sddm

# desktop
pacman -S --needed --noconfirm adobe-source-code-pro-fonts adobe-source-sans-fonts adobe-source-serif-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
pacman -S --needed --noconfirm gnu-free-fonts firefox
pacman -S --needed --noconfirm p7zip mpv tumbler ffmpegthumbnailer
pacman -S --needed --noconfirm fcitx5-im fcitx5-rime

# yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S --needed --noconfirm shell_gpt

