#!/bin/sh

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

exec 1> >(tee "stdout.extra.log")
exec 2> >(tee "stderr.extra.log" >&2)

sudo scutil --set HostName oxygen
sudo scutil --set LocalHostName oxygen
sudo scutil --set ComputerName oxygen
dscacheutil -flushcache

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

sudo port install \
alacritty\
bandwhich\
bash\
bash-completion\
bottom\
bzip2\
curl\
dash\
dua-cli\
exa\
git-delta\
gitui\
gnupg2\
go\
gopls\
gping\
helix\
helm\
helm_select\
hexyl\
jmeter\
k9s\
kaf\
kubectl\
kubectl_select\
kubectx\
lz4\
neofetch\
neovim\
nushell\
oha\
onefetch\
openjdk8\
openssl\
py39-pip\
py39-setuptools\
python3_select\
qemu\
ripgrep\
sbt\
scala2.12\
scala_select\
sqlite3\
starship\
sudo\
xplr\
zellij\
zenith\
zstd
