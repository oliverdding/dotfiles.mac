#!/bin/sh

eval "$(zoxide init bash)"
eval "$(starship init bash)"
source /opt/local/share/fzf/shell/key-bindings.bash
source /opt/local/share/fzf/shell/completion.bash
[[ -f ~/.cargo/env ]] && source ~/.cargo/env
