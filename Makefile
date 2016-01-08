PWD := $(PWD)
# Where I keep local binaries
BIN := $(HOME)/bin

DOTFILES := $(wildcard .*)
SRCS     := $(filter-out . .. .git .gitignore .vim, $(DOTFILES))

help: ## Shows this help
	@echo "$$(grep -h '#\{2\}' $(MAKEFILE_LIST) | sed 's/: #\{2\} /	/' | column -t -s '	')"

basic: ## Just dotfiles and bin
basic: dotfiles bin

all: ## Run this after ./bootstrap.sh
all: dotfiles bin virtualenv vim gterm


dotfiles: ## dotfiles
	@echo "* Linking dotfiles"
	@$(foreach file, $(SRCS), \
	  ln -sf $(PWD)/$(file) ~/$(file); echo "  - linking $(file)";)

.PHONY: bin
bin: ## Setup my personal global helper scripts
	@echo "* Linking personal bin/..."
	@mkdir -p $(BIN)
	@$(foreach file, $(wildcard bin/*), \
	  cd $(BIN) && ln -s $(PWD)/$(file) 2> /dev/null && \
	  echo "linking $(file)" || \
	  echo "skipping $(file)";)

.PHONY: virtualenv
virtualenv: # Set up my personal virtualenv script hooks
	@echo "* Setting up virtualenv hooks..."
	@if [ -z "$$WORKON_HOME" ]; then echo "missing \$$WORKON_HOME"; exit 1; fi
	@$(foreach file, $(wildcard virtualenv/*), \
	  cd $$WORKON_HOME && ln -sf $(PWD)/$(file) && echo "linking $(file)";)

gterm: # My visual customizations for gterm
	@echo "* Linking gnome terminal settings"
	@cd ~/.config/gtk-3.0 && ln -sf $(PWD)/.config/gtk-3.0/gtk.css

atom/freeze:
	@mkdir -p ./.atom
	apm list --installed --bare > .atom/package-list.txt

atom:
	cd ${HOME} && ln -sf $(PWD)/.atom || true
	@# apm install --packaged-file .atom/package-list.txt
	@# workaround for error: ENOPACKAGEJSON
	cat .atom/package-list.txt | xargs apm install

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

vim: ## Vim
	@echo "* Linking vim config"
	@cd $(HOME) && ln -sf $(PWD)/.vim
	-git clone https://github.com/Shougo/neobundle.vim.git .vim/bundle/neobundle.vim
	cd .vim/bundle/neobundle.vim && git checkout ver.3.2
	.vim/bundle/neobundle.vim/bin/neoinstall


.PHONY: resources/oui.txt
resources/oui.txt:
	curl http://standards.ieee.org/develop/regauth/oui/oui.txt > $@
