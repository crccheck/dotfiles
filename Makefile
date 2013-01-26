PWD:=$(PWD)


# Setup virtualenv bin
virtualenv:
	@if [ -z "$$WORKON_HOME" ]; then echo "missing \$$WORKON_HOME"; exit 1; fi
	@$(foreach file, $(wildcard virtualenv/*), \
		cd $$WORKON_HOME && ln -s -f $(PWD)/$(file) && echo "linking $(file)";\
		)

.PHONY: virtualenv
