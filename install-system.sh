sudo scutil --set HostName oxygen
sudo scutil --set LocalHostName oxygen
sudo scutil --set ComputerName oxygen
dscacheutil -flushcache

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
