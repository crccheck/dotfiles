# For OSX 10.11 El Capitan

brew install python gti ponysay jq pv vim bash ack gnu-sed chromedriver tree \
  sshrc pkg-config typesafe-activator the_silver_searcher node redis terraform \
  imagemagick wget coway fortune

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
  karabiner \
  # My window manager
  slate

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
# http://apple.stackexchange.com/questions/116617/how-to-separate-mouse-and-trackpad-settings/197396#197396
# Karabiner Preferences > Change Key
# > Karabiner core settings > Exclude devices > Don't remap Apple's pointing devices
# > Pointing Device > Reverse scrolling direction > Reverse Vertical Scrolling
# > Change Control_L Key (Left Control) > Control_L to Fn
# > Change Fn Key > Fn to Control_L
# > Change Delete Key > Control+Delete to Forward Delete
# For some fucking reason, OSX cannot will not let you change brightness unless you do...
# > Change F1..F19 Key ... > Change F1..F19 Key > F1..F12 to Functional... > F1,F2 to Brightness Adjust

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
