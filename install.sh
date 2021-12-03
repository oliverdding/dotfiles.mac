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

mkdir -p $HOME/.local/share/bash

echo "##########################"
echo "linking user's dotfiles..."
echo "##########################"

link ".bash_profile"
link ".bashrc"

link ".config/alacritty"
link ".config/bash-completion/bash_completion"
link ".config/bottom"
link ".config/gdb/init"
link ".config/git/config"
link ".config/git/common"
link ".config/git/ignore"
link ".config/k9s/skin.yml"
link ".config/npm"
link ".config/nu"
link ".config/nvim"
link ".config/zellij"
link ".config/starship.toml"
link ".config/wgetrc"

link ".gnupg/dirmngr.conf"
link ".gnupg/gpg-agent.conf"
link ".gnupg/gpg.conf"

link ".local/bin/bujar"
link ".local/bin/ch"
link ".local/bin/client"
link ".local/bin/gdb"
link ".local/bin/helm2"
link ".local/bin/k"
link ".local/bin/ls"
link ".local/bin/sh"
link ".local/bin/sqlite3"
link ".local/bin/upjar"
link ".local/bin/vim"
link ".local/bin/wget"

echo "############################"
echo "configure others dotfiles..."
echo "############################"

echo "installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

touch ~/.config/git/git-credentials
chmod 600 ~/.config/git/git-credentials
