# For OSX 10.11 El Capitan

brew install python gti ponysay jq vim bash ack gnu-sed chromedriver tree sshrc pkg-config typesafe-activator
brew install homebrew/versions/mysql55

brew install caskroom/cask/brew-cask

# utils
brew cask install \
  virtualbox virtualbox-extension-pack graphviz vagrant quicklook-json

# get started
brew cask install \
  firefox google-chrome \
  slate karabiner iterm2 \
  keepassx

# dev
# This installs Postgres.app, NOT the same as `brew install postgres`
brew cask install postgres atom


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


# TODO: sudoers


# At this point, you're forced to upgrade to El Capitan
# Manually install XCode from the App Store
brew install macvim
