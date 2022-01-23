#!/bin/sh

export PASSWORD_STORE_CHARACTER_SET="a-zA-Z0-9~!@#$%^&*()-_=+[]{};:,.<>?"
export PASSWORD_STORE_GENERATED_LENGTH="20"

source /opt/local/share/fzf/shell/key-bindings.bash
source /opt/local/share/fzf/shell/completion.bash
