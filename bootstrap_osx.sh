# For OSX 10.10 Yosemite

brew install python gti ponysay jq pv vim bash bash_completion ack gnu-sed chromedriver tree \
  sshrc pkg-config typesafe-activator the_silver_searcher node redis terraform

brew install homebrew/versions/mysql56

brew install openssl curl
brew link --force openssl curl

brew install caskroom/cask/brew-cask

# utils
brew cask install \
  dockertoolbox \
  virtualbox virtualbox-extension-pack \
  vagrant \
  java \
  graphviz \
  quicklook-json

# Get started with some programs
brew cask install \
  # Let me edit files
  atom \
  # Internet
  firefox \
  # It's paleo
  flux \
  # Internet
  google-chrome \
  # Better than Terminal
  iterm2 \
  # Remap the keys the sensible way
  karabiner \
  # Shhhhhh!
  keepassx \
  # This installs Postgres.app, NOT the same as `brew install postgres`
  postgres \
  # This gives you natural scrolling for the touchpad and normal scrolling for the mousewheel
  scroll-reverser \
  # My window manager
  slate

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

# Kill iTunes
# http://apple.stackexchange.com/questions/87344/how-to-delete-itunes-once-and-for-all-from-the-command-line
softwareupdate --ignore iTunes
sudo rm -r /Applications/iTunes.app/
touch /Applications/iTunes.app
chflags hidden /Applications/iTunes.app


# TODO: sudoers


# At this point, you're forced to upgrade to El Capitan
# Manually install XCode from the App Store or just not do this
brew install macvim
