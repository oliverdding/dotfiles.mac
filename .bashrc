#
# ~/.bashrc
#

export KUBECONFIG=$(echo $(ls ~/.kube/config.d/* 2>/dev/null) | sed 's/ /:/g')

export ATOM_HOME=$XDG_DATA_HOME/atom
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export MACHINE_STORAGE_PATH=$XDG_DATA_HOME/docker-machine
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle
export GTK_RC_FILES=$XDG_CONFIG_HOME/gtk-1.0/gtkrc
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql_history
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
export PSQLRC=$XDG_CONFIG_HOME/pg/psqlrc
export PSQL_HISTORY=$XDG_CACHE_HOME/pg/psql_history
export WORKON_HOME=$XDG_DATA_HOME/virtualenvs
export GDBHISTFILE=$XDG_DATA_HOME/gdb/history
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo
export GOPATH=$XDG_DATA_HOME/go
export PYTHON_EGG_CACHE=$XDG_CACHE_HOME/python-eggs
export REDISCLI_HISTFILE=$XDG_DATA_HOME/redis/rediscli_history
export REDISCLI_RCFILE=$XDG_CONFIG_HOME/redis/redisclirc
export SCREENRC=$XDG_CONFIG_HOME/screen/screenrc
export WGETRC=$XDG_CONFIG_HOME/wgetrc
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export WORKON_HOME=$XDG_DATA_HOME/virtualenvs
export PYLINTHOME=$XDG_CACHE_HOME/pylint
export BASH_COMPLETION_USER_FILE=$XDG_CONFIG_HOME/bash-completion/bash_completion
export HISTFILE=$XDG_DATA_HOME/bash/history
export K9SCONFIG=$XDG_CONFIG_HOME/k9s
export PYLINTRC=$XDG_CONFIG_HOME/pylint/config
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export LESSHISTFILE=-

export QAPM_HOME=$HOME/Developer/QAPM
