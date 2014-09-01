PWD:=$(PWD)
BIN:=$(HOME)/bin

all: dotfiles bin virtualenv

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


.PHONY: resources/oui.txt
resources/oui.txt:
	curl http://standards.ieee.org/develop/regauth/oui/oui.txt > $@
