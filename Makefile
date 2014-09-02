PWD:=$(PWD)
# Where I keep local binaries
BIN:=$(HOME)/bin

all: dotfiles bin virtualenv gterm vim

dotfiles:
	@./dostuff

# setup my personal global helper scripts
.PHONY: bin
bin:
	@echo "* linking personal bin/..."
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

.PHONY: vim
vim:
	@echo "* Linking vim config"
	@if [ -L ~/.vim ]; then \
	  rm ~/.vim; \
	fi
	@ln -s $(PWD)/.vim ~/.vim


.PHONY: resources/oui.txt
resources/oui.txt:
	curl http://standards.ieee.org/develop/regauth/oui/oui.txt > $@
