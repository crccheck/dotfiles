PWD:=$(PWD)
BIN:=$(HOME)/bin

all:
	@$(MAKE) -s bin
	@$(MAKE) -s virtualenv

# setup my personal global helper scripts
bin:
	@echo "* make $(MAKECMDGOALS)"
	@mkdir -p $(BIN)
	@$(foreach file, $(wildcard bin/*), \
		cd $(BIN) && ln -s -f $(PWD)/$(file) && echo "linking $(file)";)

# setup virtualenv bin
virtualenv:
	@echo "* make $(MAKECMDGOALS)"
	@if [ -z "$$WORKON_HOME" ]; then echo "missing \$$WORKON_HOME"; exit 1; fi
	@$(foreach file, $(wildcard virtualenv/*), \
		cd $$WORKON_HOME && ln -s -f $(PWD)/$(file) && echo "linking $(file)";)

.PHONY: all bin virtualenv
