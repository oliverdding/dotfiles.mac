if status is-interactive
    zoxide init fish | source
    starship init fish | source
    atuin init fish | source
    source /opt/local/share/fzf/shell/key-bindings.fish
end
