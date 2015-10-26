PWD:=$(PWD)
# Where I keep local binaries
BIN:=$(HOME)/bin

DOTFILES := $(wildcard .*)
# TODO use target specific variables to reduce duplication
SRCS     := $(filter-out . .. .git .gitignore .vim, $(DOTFILES))

all: dotfiles bin virtualenv vim gterm

basic: dotfiles bin

dotfiles:
	@echo "* Linking dotfiles"
	@$(foreach file, $(SRCS), \
	  ln -sf $(PWD)/$(file) ~/$(file); echo "linking $(file)";)

# setup my personal global helper scripts
.PHONY: bin
bin:
	@echo "* Linking personal bin/..."
	@mkdir -p $(BIN)
	@$(foreach file, $(wildcard bin/*), \
	  cd $(BIN) && ln -s $(PWD)/$(file) 2> /dev/null && echo "linking $(file)" || echo "skipping $(file)";)

# setup virtualenv bin
.PHONY: virtualenv
virtualenv:
	@echo "* Setting up virtualenv hooks..."
	@if [ -z "$$WORKON_HOME" ]; then echo "missing \$$WORKON_HOME"; exit 1; fi
	@$(foreach file, $(wildcard virtualenv/*), \
	  cd $$WORKON_HOME && ln -sf $(PWD)/$(file) && echo "linking $(file)";)

# link gnome terminal config
# TODO skip if gnome-terminal does not exist
gterm:
	@echo "* Linking gnome terminal settings"
	@if [ -d ~/.gconf/apps/gnome-terminal ]; then \
	  rm -rf ~/.gconf/apps/gnome-terminal; \
	elif [ -L ~/.gconf/apps/gnome-terminal ]; then \
	  rm ~/.gconf/apps/gnome-terminal; \
	fi
	@ln -s $(PWD)/gnome-terminal ~/.gconf/apps/gnome-terminal

# Make sure to do this after sublime text is installed
# https://packagecontrol.io/docs/syncing
st3:
	@echo "* Linking my Sublime Text config"
	@cd ~/.config/sublime-text-3/Packages && rm -rf User && \
	  ln -sf $(PWD)/sublime-text-3/User

st3osx:
	cd ~/bin && ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl
	cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages && \
	  rm -rf User && \
	  ln -sf $(PWD)/sublime-text-3/User
# dumping my other OSX stuff here too for now
	cd ~/bin && ln -sf /Applications/Karabiner.app/Contents/Library/bin/karabiner

.PHONY: vim
vim:
	@echo "* Linking vim config"
	@cd $(HOME) && ln -sf $(PWD)/.vim


.PHONY: resources/oui.txt
resources/oui.txt:
	curl http://standards.ieee.org/develop/regauth/oui/oui.txt > $@
