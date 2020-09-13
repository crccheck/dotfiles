PWD := $(shell echo $$PWD)
# Where I keep local binaries
BIN := $(HOME)/bin

DOTFILES := $(wildcard .*)
SRCS     := $(filter-out . .. .git .gitignore .vim, $(DOTFILES))

help: ## Shows this help
	@echo "$$(grep -h '#\{2\}' $(MAKEFILE_LIST) | sed 's/: #\{2\} /	/' | column -t -s '	')"

basic: ## Just the basics that work everywhere
basic: dotfiles bin bashmarks

all: ## Run this after ./bootstrap.sh
all: basic virtualenv vim gterm

dotfiles: ## dotfiles
	@echo "* Linking dotfiles"
	@cd && $(foreach file, $(SRCS), \
	  [ ! -h "$(file)" -a -f "$(PWD)/$(file)" ] && \
	  ln -s $(PWD)/$(file) && echo "  linking $(file)" || echo "  skipping $(file)";)

.PHONY: bin
bin: ## Setup my personal global helper scripts
	@echo "* Linking personal bin/..."
	@mkdir -p $(BIN)
	@$(foreach file, $(wildcard bin/*), \
	  cd $(BIN) && ln -s $(PWD)/$(file) 2> /dev/null && \
	  echo "linking $(file)" || \
	  echo "skipping $(file)";)

osx: ## OSX specific things
osx: bin
	cd $(HOME) && ln -sf $(PWD)/.hammerspoon

.PHONY: bashmarks
bashmarks:
	git submodule update --init bashmarks

.PHONY: virtualenv
virtualenv: # Set up my personal virtualenv script hooks
	@echo "* Setting up virtualenv hooks..."
	@if [ -z "$$WORKON_HOME" ]; then echo "missing \$$WORKON_HOME"; exit 1; fi
	@$(foreach file, $(wildcard virtualenv/*), \
	  cd $$WORKON_HOME && ln -sf $(PWD)/$(file) && echo "linking $(file)";)

gterm: # My visual customizations for gterm
	@echo "* Linking gnome terminal settings"
	@cd ~/.config/gtk-3.0 && ln -sf $(PWD)/.config/gtk-3.0/gtk.css

vim: ## Vim
	@echo "* Linking vim config"
	@cd $(HOME) && ln -sf $(PWD)/.vim
	-git clone https://github.com/Shougo/neobundle.vim.git .vim/bundle/neobundle.vim
	cd .vim/bundle/neobundle.vim && git checkout ver.4.0
	.vim/bundle/neobundle.vim/bin/neoinstall

.PHONY: resources/oui.txt
resources/oui.txt:
	mkdir -p resources
	curl -L http://standards.ieee.org/develop/regauth/oui/oui.txt > $@
