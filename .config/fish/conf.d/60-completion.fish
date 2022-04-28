if status is-interactive
    type -q kaf && kaf completion fish | source
    type -q kubectl && kubectl completion fish | source
    type -q helm && helm completion fish | source
    type -q limactl && limactl completion fish | source
    type -q rustup && rustup completions fish | source
    type -q krew && krew completion fish | source
    type -q colima && colima completion fish | source
end