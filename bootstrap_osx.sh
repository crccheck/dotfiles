# For OSX 10.14 Mojave

# See current Homebrew installation instructions at https://brew.sh/ and install

# Get my stuff, install then configure
brew install syncthing

# Iterm2
# https://iterm2.com/downloads.html
# General -> Preferences
# Load preference from a custom folder or URL: .../dotfiles/iterm

# Automation
brew install hammerspoon

# Basic commands used by my dotfiles
# findutils: GNU find xargs locate
# coreutils: gdate
# bash-completion is required for some zsh completion scripts
brew install gnu-sed wget \
  openssl curl \
  findutils coreutils \
  bash-completion \
  direnv

brew install gti sl ponysay
brew install jq vim bash ack tree \
  sshrc pkg-config the_silver_searcher \
  git

# brew install mysql@5.6

# utils
brew cask install \
  graphviz \
  quicklook-json qlvideo

# Get started with some programs
brew install \
  # Don't sleep
  caffeine \
  # Internet
  # firefox google-chrome \
  # Shhhhhh!
  keepassxc
  # This installs Postgres.app, NOT the same as `brew install postgres`
  # postgres-unofficial


# Python
########
brew install openssl readline sqlite3 xz zlib
curl https://pyenv.run | bash
# Go through pyenv setup
# This will show you versions, pick the latest
pyenv install 3.10
pyenv global 3.10.xx
brew install poetry pipx

# Node
brew install n
n lts
# NVM
# See installation instructions at https://github.com/creationix/nvm
nvm alias default system

# The rest
brew install ffmpeg pv redis terraform imagemagick cowsay fortune
brew cask install vlc

# https://pilotmoon.com/scrollreverser/
brew install scroll-reverser
# Reverse scroll on the mouse only, reverse vertical and horizontal
# https://superuser.com/questions/382024/reversing-scroll-direction-across-synergy-connection
defaults write com.pilotmoon.scroll-reverser ReverseOnlyRawInput -bool YES
# Then restart Scroll Reverser
# https://stackoverflow.com/a/44010683
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Preferences
# -----------
#
# System Preferences → Keyboard → Keyboard → Modifier Keys...
# Globe to ^Control
# Control to Globe
#
# Use F1, F2, etc. keys as standard function keys


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
