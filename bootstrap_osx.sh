# For OSX 10.14 Mojave

brew install gti sl ponysay jq vim bash ack gnu-sed tree \
  sshrc pkg-config the_silver_searcher \
  wget bash-completion \
  git

# brew install mysql@5.6

# Fucking incompatible OSX BDS piece of shit junkware
brew install openssl curl
# GNU find xargs locate
brew install findutils

# utils
brew cask install \
  graphviz \
  quicklook-json qlvideo

# Iterm2
brew cask install iterm2
# General -> Preferences
# Load preference from a custom folder or URL: .../dotfiles/iterm

# Get started with some programs
brew cask install \
  # Don't sleep
  caffeine \
  # Internet
  firefox google-chrome \
  # It's paleo, yo
  flux \
  # Shhhhhh!
  keepassx \
  # This installs Postgres.app, NOT the same as `brew install postgres`
  postgres \
  # Automation
  hammerspoon

# Atom
brew cask install atom
make atom

# Karabiner-Elements and Keyboard customizations
brew cask install karabiner-elements
# Karabiner elements:
# Devices -> uncheck daskeyboard (makes it so Apple keyboard preferences will work below)
# https://github.com/tekezo/Karabiner-Elements/issues/1700
# Devices -> check "no product name", Product ID 34304
# Keyboard control panel:
# check Use F1, F2, etc. keys as standard function keys on external keyboards
# Modifier Keys...
# - daskeyboard
#   - Option to Command
#   - Command to Option
 
# Python
# brew install python python3
# cd ~/bin
# ln -s $(which python3) python
# ln -s $(which pip3) pip
brew install zlib pyenv
pyenv init
pyenv install 3.6.8 3.7.3

# Node
brew install n
n lts
# NVM
# See installation instructions at https://github.com/creationix/nvm
# nvm alias default system

# The rest
brew install ffmpeg pv redis terraform imagemagick cowsay fortune
brew cask install vlc

# https://pilotmoon.com/scrollreverser/
brew cask install scroll-reverser
# Reverse scroll on the mouse only
# https://superuser.com/questions/382024/reversing-scroll-direction-across-synergy-connection
defaults write com.pilotmoon.scroll-reverser ReverseOnlyRawInput -bool YES

# Preferences
# -----------
#
# Disable updates
# Hot corners
#
# #### Disable all Mission Control Keyboard Shortcut so ^ left/right works
# System Preferences → Keyboard → Shortcuts → Mission Control
#
# Spotlight
# Disable Spotlight Suggestions

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
# Run Postgres.app. Then see
# http://postgresapp.com/documentation/cli-tools.html
# to add '/Applications/Postgres.app/Contents/Versions/latest/bin' to your PATH (already done in .crcrc)
