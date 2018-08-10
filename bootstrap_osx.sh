# For OSX 10.11 El Capitan

brew install python python3 gti ponysay jq pv vim bash ack gnu-sed chromedriver tree \
  sshrc pkg-config typesafe-activator the_silver_searcher node redis terraform \
  imagemagick wget cowsay fortune bash-completion

# brew install homebrew/versions/mysql56

# Fucking incompatible OSX BDS piece of shit junkware
brew install openssl curl
brew link --force openssl curl
# GNU find xargs locate
brew install findutils --with-default-names

brew install caskroom/cask/brew-cask

# utils
brew cask install \
  graphviz \
  quicklook-json qlvideo

# Get started with some programs
brew cask install \
  # Let me edit files
  atom \
  # Don't sleep
  caffeine \
  # Internet
  firefox google-chrome \
  # It's paleo, yo
  flux \
  # Better than Terminal
  iterm2 \
  # Shhhhhh!
  keepassx \
  # This installs Postgres.app, NOT the same as `brew install postgres`
  postgres \
  # Remap the keys the sensible way
  karabiner hammerspoon \
  # My window manager
  slate

# Use Python3 by default
cd ~/bin
ln -s $(which python3) python
ln -s $(which pip3) pip

# Gems
gem install lolcommits

# Preferences
# -----------
#
# ### Keyboard
#
# Full Keyboard Access: All controls (or Control F7)
# * Use all F1, F2, etc. keys as standard function keys
#
# Disable updates
# Hot corners
#
# #### Disable Mission Control Keyboard Shortcut so ^ left/right works
# System Preferences → Keyboard → Shortcuts → Mission Control

# Karabiner settings
# TODO look into http://apple.stackexchange.com/questions/200332/different-key-maps-bindings-for-in-built-keyboard-and-bluetooth-keyboard
# http://apple.stackexchange.com/questions/116617/how-to-separate-mouse-and-trackpad-settings/197396#197396
# Karabiner Preferences > Change Key
# > Karabiner core settings > Exclude devices > Don't remap Apple's pointing devices
# > Pointing Device > Reverse scrolling direction > Reverse Vertical Scrolling
# > Change Delete Key > Control+Delete to Forward Delete

# Finder settings
#################
# Advanced -> Show all filename extensions
# Advanced -> Hide warnings from changing an extension
# Advanced -> Search the Current Folder

# Kill iTunes
# http://apple.stackexchange.com/questions/87344/how-to-delete-itunes-once-and-for-all-from-the-command-line
softwareupdate --ignore iTunes
sudo rm -r /Applications/iTunes.app/
touch /Applications/iTunes.app
chflags hidden /Applications/iTunes.app


# TODO: sudoers

# Followup
# --------
# Run Postgres.app. It'll move itself to /Applications Then see
# http://postgresapp.com/documentation/cli-tools.html
# to add '/Applications/Postgres.app/Contents/Versions/latest/bin' to your PATH

# vi ~/.config/configstore/update-notifier-npm.json
