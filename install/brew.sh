#!/bin/sh

git clone --depth=1 https://github.com/Homebrew/brew $HOME/.local/share/brew
$HOME/.local/share/brew/bin/brew update

brew install bash bash-completion2 bat bottom curl dash exa fd fzf git git-delta gitui gnupg2 neovim openssl pass ripgrep tree-sitter starship xplr zoxide zstd
brew install hexyl hurl dua-cli onefetch glow ouch tokei xsv
