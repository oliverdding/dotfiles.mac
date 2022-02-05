#!/bin/sh

export DOCKER_BUILDKIT="1"
export GOPROXY="https://goproxy.io,direct"
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export PASSWORD_STORE_CHARACTER_SET="a-zA-Z0-9~!@#$%^&*()-_=+[]{};:,.<>?"
export PASSWORD_STORE_GENERATED_LENGTH="20"

KUBECONFIG=$(echo $(ls ~/.kube/config.d/* 2>/dev/null) | sed 's/ /:/g')
export KUBECONFIG="$KUBECONFIG"
unset KUBECONFIG
