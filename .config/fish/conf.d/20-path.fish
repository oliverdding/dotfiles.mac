fish_add_path -gP /opt/local/sbin
fish_add_path -gP /opt/local/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.cargo/bin
fish_add_path -g $HOME/.local/share/go/bin
fish_add_path -g (ls -1dD $HOME/Library/Python/* 2>/dev/null | sed 's#$#/bin#')
fish_add_path -g $HOME/.npm/bin
fish_add_path -g $HOME/.krew/bin
