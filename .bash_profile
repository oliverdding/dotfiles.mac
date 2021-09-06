#
# ~/.bash_profile
#

export PATH="$HOME/.local/bin:$HOME/.local/bin-private:/opt/local/bin:/opt/local/sbin:$PATH"

export PATH="/opt/local/lib/postgresql13/bin:$PATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US
export LC_MONETARY=en_US.UTF-8
export LC_TIME=en_US.UTF-8

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export DIFFPROG=delta
export DOCKER_BUILDKIT=1
export GO111MODULE=on
export GOPROXY=https://goproxy.io,direct

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.local/share/cargo/env ]] && source ~/.local/share/cargo/env

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

eval "$(starship init bash)"
