# Bootstrap macOS 16 Tahoe

Set city/timezone to "Accra - Ghana" (possible Néma - Mauritania?) and 24-hour time.

## Preferences

- **Keyboard → Keyboard Shortcuts → Modifier Keys**
  - Caps Lock → Escape
  - Globe → ^Control
  - Control → Globe
- **Function Keys** → Use F1, F2, etc. as standard function keys
- **Windows** → disable all

## Hot Corners

Bottom left → "Put Display to Sleep", no other corners.

## Mission Control

Disable all keyboard shortcuts so ^ left/right works in apps. Search for "mission" in Keyboard settings → "Keyboard and Mouse Shortcuts" and disable "Mission Control", "Application Windows", "Show Desktop".

## Spotlight

- Disable "Show Related Content"
- Disable "Help Apple Improve Search"
- Disable "Spotlight Suggestions"
- Disable all "Results from Apps" except "Calculator" and "System Preferences"
- Add code projects to "Search Privacy..."

## Displays

Disable "True Tone".

## Finder

Advanced → Show all filename extensions, Hide warnings from changing an extension, Search the Current Folder.

## Homebrew

See current installation instructions at https://brew.sh/. Add it to your environment as directed; dotfiles will replace it later.

```shell
brew install syncthing
```

## iTerm2

Download from https://iterm2.com/downloads.html.

General → Preferences → Load preference from a custom folder or URL: `.../dotfiles/iterm`

## Automation

```shell
brew install hammerspoon
```

## Basic Commands

Used by dotfiles. `bash-completion` is required for some zsh completion scripts.

```shell
brew install gnu-sed gawk grep wget \
  openssl curl \
  findutils coreutils \
  bash-completion \
  starship \
  direnv
```

```shell
brew install jq neovim bash tree \
  pkg-config the_silver_searcher \
  git
```

## Core Apps

```shell
brew install \
  caffeine \
  keepassxc
```

Optional fun: `brew install gti sl ponysay cowsay fortune`

Optional utils: `brew cask install graphviz quicklook-json qlvideo`

## File Associations

```shell
brew install duti
duti -s com.microsoft.VSCode .json all
```

## SSH

- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
- https://github.com/settings/keys

```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
ssh-add --apple-use-keychain
```

## Install Dotfiles

TODO

## Python

```shell
brew install openssl readline sqlite3 xz
curl -fsSL https://pyenv.run | bash
```

Go through pyenv setup. This shows available versions — pick the latest:

```shell
pyenv install 3.13
pyenv global 3.13.xx
curl -LsSf https://astral.sh/uv/install.sh | sh
```

`watchman` is the only file watcher that works with ipdb without mangling readline:

```shell
brew install watchman
```

## Node

```shell
brew install n
n lts
```

Alternatively, use NVM — see https://github.com/creationix/nvm.

## Miscellaneous

```shell
brew install ffmpeg pv redis terraform imagemagick
brew cask install vlc
```

## Scroll Reverser

https://pilotmoon.com/scrollreverser/ — reverse scroll on the mouse only (vertical and horizontal). See also https://superuser.com/questions/382024/reversing-scroll-direction-across-synergy-connection.

```shell
brew install scroll-reverser
defaults write com.pilotmoon.scroll-reverser ReverseOnlyRawInput -bool YES
```

Then restart Scroll Reverser.
## VSCode

Fix press-and-hold for accented characters breaking keybindings (https://stackoverflow.com/a/44010683):

```shell
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

Then restart VSCode.

## Rust

```shell
brew install rust
```

## Go

```
brew install golang
```

## TODO: sudoers

## Disable Music from Login Items

```shell
sudo rm -rf /Library/LaunchAgents/*Music*
sudo rm -rf /Library/Caches/*Music*
sudo rm -rf /Library/Preferences/*Music*
sudo rm -rf ~/Library/Caches/*Music*
osascript -e 'tell application "System Events" to get the name of every login item'
osascript -e 'tell application "System Events" to delete login item "Music"'
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist
```

## Claude Code LSP

Open `~/.claude/settings.json` and add `"ENABLE_LSP_TOOL": "1"`.

```shell
npm i -g pyright
claude plugin marketplace update claude-plugins-official
claude plugin install pyright-lsp
npm i -g typescript-language-server typescript
claude plugin install typescript-lsp
```

## Postgres (optional)

This installs Postgres.app — NOT the same as `brew install postgres`.

Run Postgres.app, then see http://postgresapp.com/documentation/cli-tools.html to add `/Applications/Postgres.app/Contents/Versions/latest/bin` to your PATH (already done in `.crcrc`).

## AWS

Just use the "GUI" instructions from https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
