if status is-interactive
    type -q zoxide && zoxide init fish | source
    type -q starship && starship init fish | source
    source /opt/local/share/fzf/shell/key-bindings.fish
    type -q mcfly & mcfly init fish | source
end
