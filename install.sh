#!/bin/sh

set -e
exec 2> >(while read line; do echo -e "\e[01;31m$line\e[0m"; done)

dotfiles_dir="$(
    cd "$(dirname "$0")"
    pwd
)"
cd "$dotfiles_dir"

#############
# Functions #
#############

link() {
    orig_file="$dotfiles_dir/$1"
    if [ -n "$2" ]; then
        dest_file="$HOME/$2"
    else
        dest_file="$HOME/$1"
    fi

    mkdir -p "$(dirname "$orig_file")"
    mkdir -p "$(dirname "$dest_file")"

    rm -rf "$dest_file"
    ln -s "$orig_file" "$dest_file"
    echo "$dest_file -> $orig_file"
}

#################
# Configuration #
#################

echo "##################"
echo "mkdir directory..."
echo "##################"

mkdir -p "$HOME"/.ssh
mkdir -p "$HOME"/.local/share/git

echo "##########################"
echo "linking user's dotfiles..."
echo "##########################"

link ".cargo/config"

link ".config/bottom"
link ".config/fd/ignore"
link ".config/gdb/init"
link ".config/git/config"
link ".config/git/common"
link ".config/git/ignore"
link ".config/bash_completion"
link ".config/starship.toml"

link ".gnupg/dirmngr.conf"
link ".gnupg/gpg-agent.conf"
link ".gnupg/gpg.conf"

link ".k9s/skin.yml"

link ".local/bin/bujar"
link ".local/bin/ch"
link ".local/bin/client"
link ".local/bin/k"
link ".local/bin/ls"
link ".local/bin/upjar"

link ".local/etc/profile.d"
link ".local/etc/profile"

link ".bash_profile"
link ".bashrc"

chmod 700 $HOME/.ssh

echo "############################"
echo "configure others dotfiles..."
echo "############################"

if [[ -d "$HOME/.config/nvim" ]]; then git -C $HOME/.config/nvim pull; else git clone https://github.com/NvChad/NvChad.git $HOME/.config/nvim --depth 1; fi
link ".config/nvim/lua/custom"
