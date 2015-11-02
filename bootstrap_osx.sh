# For OSX 10.10 Yosemite

#
# apps:
# * bittorrent sync

brew install python mysql gti ponysay jq macvim vim bash ack gnu-sed chromedriver

brew install caskroom/cask/brew-cask

# get started
brew cask install firefox google-chrome slate karabiner virtualbox iterm2 \
  keepassx sshrc \
  pkg-config graphviz
# dev
brew cask install postgres sublime-text
# apps
brew cask install vagrant typesafe-activator quicklook-json

# also need to get virtualbox extensions

# Preferences
# -----------
#
# ### Keyboard
# Full Keyboard Access: All controls (or Control F7)
#
# Disable updates
# Hot corners
#
# Disable Mission Control so ^ left/right works
# System Preferences → Keyboard → Shortcuts → Mission Control

# Document killing iTunes
# http://apple.stackexchange.com/questions/87344/how-to-delete-itunes-once-and-for-all-from-the-command-line
softwareupdate --ignore iTunes
sudo rm -r /Applications/iTunes.app/
/Applications/iTunes.app
hidden /Applications/iTunes.app
