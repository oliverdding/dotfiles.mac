#!/bin/sh

if [ "$(id -u)" -e 0 ]; then
        echo 'This script must NOE be run by root' >&2
        exit 1
fi

# GUI

sudo port install -bcqN alacritty gitup

# CLI

sudo port install -bcqN fish terminal-notifier bat bottom curl exa fd fzf atuin git git-delta gnupg2 less neovim pass ripgrep starship zoxide xplr zstd
sudo port install -bcqN zola hexyl hurl dua-cli onefetch ouch tokei
sudo port install -bcqN kubectl-1.23 kubectl_select krew helm-2.15 helm-3.8 helm_select k9s kaf
sudo port install -bcqN qemu docker docker-compose dive colima
sudo port install -bcqN clang-13 llvm-13 lldb-13 ninja clang_select
sudo port install -bcqN lua
sudo port install -bcqN go
sudo port install -bcqN python310 py310-pip py310-setuptools py310-wheel python_select python3_select
sudo port install -bcqN openjdk8 maven3 maven_select gradle gradle-completion sbt scala2.11 scala2.11-docs scala2.12 scala2.12-docs scala2.13 scala2.13-docs scala_select
sudo port install -bcqN nodejs16 npm8

sudo port select --set kubectl kubectl1.23
sudo port select --set helm helm3.8

sudo port select --set llvm mp-llvm-13
sudo port select --set clang mp-clang-13

sudo port select --set pip pip310
sudo port select --set pip3 pip310
sudo port select --set python python310
sudo port select --set python3 python310

sudo port select --set scala scala2.13
sudo port select --set maven maven3

export PATH=$HOME/.krew/bin:$PATH
krew update
krew install ns ctx

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y --default-host $RUSTUP_HOST --no-modify-path --default-toolchain nightly --profile default --component llvm-tools-preview clippy rust-analyzer-preview rust-src
