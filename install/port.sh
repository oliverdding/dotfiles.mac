#!/bin/sh

port install -bcqN bash bash-completion bat bottom curl dash exa fd fzf git git-delta gitui gnupg2 less neovim openssl pass ripgrep starship xplr zoxide zstd
port install -bcqN hexyl hurl dua-cli onefetch glow ouch tokei
port install -bcqN kubectl-1.23 kubectl_select krew helm-2.15 helm-3.7 helm_select k9s kaf
port install -bcqN qemu
port install -bcqN clang-13 llvm-13 lldb-13 clang_select
port install -bcqN go gopls delve
port install -bcqN pipenv virtualenv_select python310 py310-pip py310-setuptools py310-debugpy py310-wheel python_select python3_select
port install -bcqN openjdk8 maven3 maven_select gradle gradle-completion sbt scala2.11 scala2.11-docs scala2.12 scala2.12-docs scala2.13 scala2.13-docs scala_select
port install -bcqN nodejs16 npm8

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
krew update
krew install ns ctx
