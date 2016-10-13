# https://terraform.io/downloads.html
TERRAFORM_VERSION = 0.7.0

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
	@$(foreach file, $(SRCS), \
	  [ ! -e "$(PWD)/$(file)" ] && ln -s $(PWD)/$(file) ~/$(file); echo "  - linking $(file)";)

.PHONY: bin
bin: ## Setup my personal global helper scripts
	@echo "* Linking personal bin/..."
	@mkdir -p $(BIN)
	@$(foreach file, $(wildcard bin/*), \
	  cd $(BIN) && ln -s $(PWD)/$(file) 2> /dev/null && \
	  echo "linking $(file)" || \
	  echo "skipping $(file)";)

osx: ## OSX specific things
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

atom/freeze:
	@mkdir -p ./.atom
	apm list --installed --bare > .atom/package-list.txt

atom:
	cd ${HOME} && ln -sf $(PWD)/.atom || true
	@# apm install --packaged-file .atom/package-list.txt
	@# workaround for error: ENOPACKAGEJSON
	cat .atom/package-list.txt | grep -v emmet | xargs apm install
	@$(MAKE) -s .atom/packages/emmet-atom

.atom/packages/emmet-atom:
	cd .atom/packages && git clone git@github.com:crccheck/emmet-atom
	cd .atom/packages/emmet-atom && \
	  git remote add emmet https://github.com/emmetio/emmet-atom.git && \
	  npm install

vim: ## Vim
	@echo "* Linking vim config"
	@cd $(HOME) && ln -sf $(PWD)/.vim
	-git clone https://github.com/Shougo/neobundle.vim.git .vim/bundle/neobundle.vim
	cd .vim/bundle/neobundle.vim && git checkout ver.4.0
	.vim/bundle/neobundle.vim/bin/neoinstall

terraform:
	[ ! -d /usr/local/terraform-$(TERRAFORM_VERSION) ]
	cd /tmp && \
	  wget https://releases.hashicorp.com/terraform/$(TERRAFORM_VERSION)/terraform_$(TERRAFORM_VERSION)_linux_amd64.zip
	unzip /tmp/terraform_$(TERRAFORM_VERSION)_linux_amd64.zip -d /usr/local/terraform-$(TERRAFORM_VERSION)
	rm -f /usr/local/terraform /usr/local/bin/terraform
	ln -s /usr/local/terraform-$(TERRAFORM_VERSION) /usr/local/terraform
	ln -s /usr/local/terraform/terraform /usr/local/bin/terraform


.PHONY: resources/oui.txt
resources/oui.txt:
	curl http://standards.ieee.org/develop/regauth/oui/oui.txt > $@
