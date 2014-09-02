PWD:=$(PWD)
# Where I keep local binaries
BIN:=$(HOME)/bin

DOTFILES := $(wildcard .*)
# TODO use target specific variables to reduce duplication
SRCS     := $(filter-out . .. .git .gitignore .vim, $(DOTFILES))

all: dotfiles bin virtualenv gterm vim

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
	  cd $(BIN) && ln -sf $(PWD)/$(file) && echo "linking $(file)";)

# setup virtualenv bin
.PHONY: virtualenv
virtualenv:
	@echo "* Setting up virtualenv hooks..."
	@if [ -z "$$WORKON_HOME" ]; then echo "missing \$$WORKON_HOME"; exit 1; fi
	@$(foreach file, $(wildcard virtualenv/*), \
	  cd $$WORKON_HOME && ln -sf $(PWD)/$(file) && echo "linking $(file)";)

# link gnome terminal config
gterm:
	@echo "* Linking gnome terminal settings"
	@if [ -d ~/.gconf/apps/gnome-terminal ]; then \
	  rm -rf ~/.gconf/apps/gnome-terminal; \
	elif [ -L ~/.gconf/apps/gnome-terminal ]; then \
	  rm ~/.gconf/apps/gnome-terminal; \
	fi
	@ln -s $(PWD)/gnome-terminal ~/.gconf/apps/gnome-terminal

# Make sure to do this after sublime text is installed
st2:
	@echo "* Linking my Sublime Text config"
	@cd ~/.config/sublime-text-2 && rm -rf Packages && \
	  ln -sf $(PWD)/sublime-text-2/Packages

.PHONY: vim
vim:
	@echo "* Linking vim config"
	@cd $(HOME) && ln -sf $(PWD)/.vim


.PHONY: resources/oui.txt
resources/oui.txt:
	curl http://standards.ieee.org/develop/regauth/oui/oui.txt > $@


# These remotes are needed for git subtree
subtree:
	-git subtree add --prefix .vim/bundle/vim-unbundle https://github.com/sunaku/vim-unbundle.git master --squash 2> /dev/null
	git subtree add --prefix .vim/bundle/editorconfig https://github.com/editorconfig/editorconfig-vim.git master --squash
