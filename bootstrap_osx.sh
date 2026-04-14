# For OSX 10.16 Tahoe

# Set city/timezone to "Accra - Ghana" (possible Néma - Mauritania?)
# 24-hour time

# Preferences
# -----------
#
# Keyboard → Keyboard Shortcuts button → scroll down to Modifier Keys...
# Caps Lock to Escape
# Globe to ^Control
# Control to Globe
#
# Function Keys ->
# Use F1, F2, etc. keys as standard function keys
#
# Windows -> disable all

# Hot corners
# bottom left to "Put Display to Sleep" and no other corners

# #### Disable all Mission Control Keyboard Shortcut so ^ left/right works
# search for "mission", "Keyboard and Mouse Shortcuts"
# disable "Mission Control", "Application Windows", "Show Desktop"

# Spotlight
# disable "Show Related Content"
# disable "Help Apple Improve Search"
# disable "Spotlight Suggestions"
# disable all "Results from Apps" but "Calculator" and "System Preferences"
# add code projects to "Search Privacy..."

# Finder settings
#################
# Advanced -> Show all filename extensions
# Advanced -> Hide warnings from changing an extension
# Advanced -> Search the Current Folder


# See current Homebrew installation instructions at https://brew.sh/ and install
# Add it to your environment as directed; it'll be replaced by my dotfiles later

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
brew install gnu-sed gawk wget \
  openssl curl \
  findutils coreutils \
  bash-completion \
  direnv

# brew install gti sl ponysay
brew install jq vim bash tree \
  pkg-config the_silver_searcher \
  git

# brew install mysql@5.6

# utils
# brew cask install \
#   graphviz \
#   quicklook-json qlvideo

# Get started with some programs
brew install \
  # Don't sleep
  caffeine \
  # Internet
  # firefox google-chrome \
  keepassxc
  # This installs Postgres.app, NOT the same as `brew install postgres`
  # postgres-unofficial

# Fix file associations
brew install duti
duti -s com.microsoft.VSCode .json all

# SSH

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# https://github.com/settings/keys

# At time of writing, condensed version is:
ssh-keygen -t ed25519 -C "your_email@example.com"
ssh-add --apple-use-keychain

# Install dotfiles


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

# SSHRC
cd /Sync
git clone git@github.com:cdown/sshrc.git
cd sshrc
ln -s ~/Sync/sshrc/sshrc ~/.local/bin

# TODO: sudoers

# Followup
# --------
# Run Postgres.app. Then see
# http://postgresapp.com/documentation/cli-tools.html
# to add '/Applications/Postgres.app/Contents/Versions/latest/bin' to your PATH (already done in .crcrc)

# Fix stupid Slack asking for permissions all the time
# https://apple.stackexchange.com/questions/267685/repeatedly-trying-to-add-a-new-helper-tool-on-each-restart-for-same-applicatio/414967#414967
# rsync -av --delete /Applications/Slack.app/ ~/Applications/Slack.app/ && open ~/Applications/Slack.app
cd /Library/LaunchAgents
sudo rm -rf *Music*
cd /Library/Caches
sudo rm -rf *Music*
cd /Library/Preferences
sudo rm -rf *Music*
cd ~/Library/Caches
sudo rm -rf *Music*
osascript -e 'tell application "System Events" to get the name of every login item'
osascript -e 'tell application "System Events" to delete login item "Music"'
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

code ~/.claude/settings.json
# add   "ENABLE_LSP_TOOL": "1"
npm i -g pyright
claude plugin marketplace update claude-plugins-official
claude plugin install pyright-lsp
npm i -g typescript-language-server typescriptO
claude plugin install typescript-lsp
