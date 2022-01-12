#
# ~/.bash_profile
#

export PATH="$HOME/.local/bin:$PATH"

[[ -f ~/.local/share/cargo/env ]] && source ~/.local/share/cargo/env

eval "$(zoxide init bash)"
eval "$(starship init bash)"
