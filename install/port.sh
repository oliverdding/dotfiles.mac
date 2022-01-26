#!/bin/sh

if [ "$(id -u)" -e 0 ]; then
        echo 'This script must NOE be run by root' >&2
        exit 1
fi

sudo port install -bcqN bash bash-completion bat bottom curl dash exa fd fzf git git-delta gitui gnupg2 less neovim pass ripgrep starship xplr zoxide zstd
sudo port install -bcqN hexyl hurl dua-cli rmtrash onefetch glow ouch tokei
sudo port install -bcqN kubectl-1.23 kubectl_select krew helm-2.15 helm-3.7 helm_select k9s kaf
sudo port install -bcqN qemu
sudo port install -bcqN clang-13 llvm-13 lldb-13 cmake ninja clang_select
sudo port install -bcqN lua lua-language-server
sudo port install -bcqN go gopls delve
sudo port install -bcqN pipenv virtualenv_select python310 py310-pip py310-setuptools py310-debugpy py310-wheel python_select python3_select
sudo port install -bcqN openjdk8 maven3 maven_select gradle gradle-completion sbt scala2.11 scala2.11-docs scala2.12 scala2.12-docs scala2.13 scala2.13-docs scala_select
sudo port install -bcqN nodejs16 npm8

sudo port select --set kubectl kubectl1.23
sudo port select --set helm helm3.7

sudo port select --set llvm mp-llvm-13
sudo port select --set clang mp-clang-13

sudo port select --set pip pip310
sudo port select --set pip3 pip310
sudo port select --set python python310
sudo port select --set python3 python310
sudo port select --set virtualenv virtualenv310

sudo port select --set scala scala2.11
sudo port select --set maven maven3

export KREW_ROOT=$HOME/.local/share/krew
export PATH=$HOME/.local/share/krew/bin:$PATH
krew update
krew install ns ctx

export RUSTUP_HOME=$HOME/.local/share/rustup
export CARGO_HOME=$HOME/.local/share/cargo
curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh -s -- -q -y --default-host $RUSTUP_HOST --no-modify-path --default-toolchain nightly --profile default --component llvm-tools-preview clippy rust-analyzer-preview rust-src
