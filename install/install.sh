#!/bin/bash

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

port install -bcqN bash bash-completion bat bottom curl dash exa fd fzf git git-delta gitui gnupg2 neovim openssl pass ripgrep tree-sitter-cli starship xplr zoxide zstd
port install -bcqN hexyl hurl dua-cli onefetch glow ouch tokei xsv zellij
port install -bcqN kubectl-1.23 kubectl_select krew helm-2.15 helm-3.7 helm_select k9s kaf
port install -bcqN qemu
port install -bcqN clang-13 llvm-13 lldb-13 clang_select
port install -bcqN go gopls
port install -bcqN pipenv virtualenv_select python39 py39-pip py39-setuptools py39-debugpy py39-yaml py39-wheel python_select python3_select
port install -bcqN openjdk8 maven3 maven_select gradle gradle-completion sbt scala2.11 scala2.11-docs scala2.12 scala2.12-docs scala2.13 scala2.13-docs scala_select
port install -bcqN nodejs16 npm8 yarn
port install -bcqN gopls delve

port select --set kubectl kubectl1.23
port select --set helm helm3.7
port select --set clang mp-clang-13
port select --set virtualenv virtualenv39
port select --set pip pip39
port select --set pip3 pip39
port select --set python python39
port select --set python3 python39
port select --set scala scala2.11
port select --set maven maven3

export KREW_ROOT=$HOME/.local/share/krew
export PATH=$HOME/.local/share/krew/bin:$PATH
kubectl krew update
kubectl krew install ns ctx

export RUSTUP_HOME=$HOME/.local/share/rustup
export CARGO_HOME=$HOME/.local/share/cargo
curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh -s -- -q -y --default-host $RUSTUP_HOST --no-modify-path --default-toolchain nightly --profile default --component llvm-tools-preview clippy rust-analyzer-preview rust-src
