PWD := $(shell echo $$PWD)
# Where I keep local binaries
BIN := $(HOME)/bin

DOTFILES := $(wildcard .*)
SRCS     := $(filter-out . .. .git .gitignore .vim, $(DOTFILES))

help: ## Shows this help
	@echo "$$(grep -h '#\{2\}' $(MAKEFILE_LIST) | sed 's/: #\{2\} /	/' | column -t -s '	')"

basic: ## Just the basics that work everywhere
basic: dotfiles bin completion

all: basic virtualenv vim

dotfiles: ## dotfiles
	@echo "* Linking dotfiles"
	@cd && $(foreach file, $(SRCS), \
	  ln -sf $(PWD)/$(file) && echo "  linking $(file)" ;)

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

vim: ## Neovim
	@command -v nvim > /dev/null || (echo "neovim not installed: brew install neovim" && exit 1)
	@echo "* Linking neovim config"
	@mkdir -p ~/.config
	@ln -sfn $(PWD)/.config/nvim ~/.config/nvim
	@echo "* Installing neovim plugins"
	nvim --headless -c 'Lazy! sync' -c 'qa'

ptyxis: ## Load Ptyxis settings into dconf (save: dconf dump /org/gnome/Ptyxis/ > .config/ptyxis/ptyxis.ini)
	@echo "* Loading ptyxis settings"
	@dconf load /org/gnome/Ptyxis/ < .config/ptyxis/ptyxis.ini

niri: ## Niri window manager config
	@echo "* Linking niri config"
	@mkdir -p ~/.config
	@ln -sfn $(PWD)/.config/niri ~/.config/niri

ghostty: ## Ghostty terminal config
	@echo "* Linking ghostty config"
	@mkdir -p ~/.config
	@ln -sfn $(PWD)/.config/ghostty ~/.config/ghostty

.PHONY: resources/oui.txt
resources/oui.txt:
	mkdir -p resources
	curl -L http://standards.ieee.org/develop/regauth/oui/oui.txt > $@

.PHONY: completion
completion: ## Get external shell completion scripts
	mkdir -p completion
	curl https://raw.githubusercontent.com/aws/aws-cli/v2/bin/aws_zsh_completer.sh > completion/aws_zsh_completer.sh
	chmod +x completion/aws_zsh_completer.sh
