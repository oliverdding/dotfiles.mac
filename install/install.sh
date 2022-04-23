#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

exec 1> >(tee "stdout.log")
exec 2> >(tee "stderr.log" >&2)

script_name="$(basename "$0")"
dotfiles_dir="$(
    cd "$(dirname "$0")"
    pwd
)"
cd "$dotfiles_dir"

# read .env
while read line; do export $line; done < .env

copy() {
    orig_file="$dotfiles_dir/$1"
    dest_file="/$1"

    mkdir -p "$(dirname "$orig_file")"
    mkdir -p "$(dirname "$dest_file")"

    rm -rf "$dest_file"

    cp -R "$orig_file" "$dest_file"
    echo "$dest_file <= $orig_file"
}

# system-wide

scutil --set HostName $HOSTNAME
scutil --set LocalHostName $HOSTNAME
scutil --set ComputerName $HOSTNAME
dscacheutil -flushcache

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false
defaults write com.jetbrains.pycharm ApplePressAndHoldEnabled -bool false
defaults write com.jetbrains.clion ApplePressAndHoldEnabled -bool false
defaults write com.jetbrains.goland ApplePressAndHoldEnabled -bool false

copy "etc/pam.d/sudo"
copy "Library/LaunchDaemons/limit.maxfiles.plist"

cat '/opt/local/bin/bash' >>/etc/shells
chsh -s /opt/local/bin/bash $USERNAME

git clone git@github.com:oliverdding/pass.git ~/.password-store
