# For OSX 10.14 Mojave

brew install gti sl ponysay
brew install jq vim bash ack gnu-sed tree \
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
# General -> Preferences
# Load preference from a custom folder or URL: .../dotfiles/iterm

# Get started with some programs
brew install \
  # Don't sleep
  caffeine \
  # Internet
  # firefox google-chrome \
  # It's paleo, yo
  flux \
  # Shhhhhh!
  keepassxc \
  # This installs Postgres.app, NOT the same as `brew install postgres`
  postgres-unofficial \
  # Automation
  hammerspoon

# Python
########
brew install pyenv
pyenv init
# This will show you versions, pick the latest
pyenv install 3.10
brew install poetry
brew install pipx

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
brew install scroll-reverser
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

# TODO: sudoers

# Followup
# --------
# Run Postgres.app. Then see
# http://postgresapp.com/documentation/cli-tools.html
# to add '/Applications/Postgres.app/Contents/Versions/latest/bin' to your PATH (already done in .crcrc)
