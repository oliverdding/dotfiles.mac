#!/bin/bash

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

exec 1> >(tee "stdout.log")
exec 2> >(tee "stderr.log" >&2)

script_name="$(basename "$0")"
dotfiles_dir="$(
    cd "$(dirname "$0")"
    pwd
)"
cd "$dotfiles_dir"

copy() {
    orig_file="$dotfiles_dir/$1"
    dest_file="/$1"

    mkdir -p "$(dirname "$orig_file")"
    mkdir -p "$(dirname "$dest_file")"

    rm -rf "$dest_file"

    cp -R "$orig_file" "$dest_file"
    echo "$dest_file <= $orig_file"
}

copy "etc/paths.d/10-system"
copy "opt/local/etc/profile.d/10-paths.sh"
copy "opt/local/etc/profile.d/30-toolsets.sh"
copy "opt/local/etc/profile.d/50-program.sh"
copy "opt/local/etc/profile.d/99-eval.sh"
copy "opt/local/etc/profile"
