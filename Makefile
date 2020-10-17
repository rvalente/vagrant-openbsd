SHELL   := bash
PACKER  := packer
PACKER_VERSION := $(shell packer -version)
VAGRANT := vagrant
BOX_NAME := openbsd67
PACKER_OUTPUT := $(BOX_NAME).box
PACKERFILE := $(BOX_NAME).json

.DEFAULT_GOAL := $(PACKER_OUTPUT)

.PHONY: clean
clean:
	$(VAGRANT) destroy
	$(VAGRANT) box remove $(BOX_NAME)
	$(RM) $(PACKER_OUTPUT)

.PHONY: validate
validate:
	$(PACKER) validate $(PACKERFILE)

$(PACKER_OUTPUT): $(PACKERFILE) http/install.conf http/rc.firsttime scripts/bootstrap.sh
	$(PACKER) build $(PACKERFILE)
	$(VAGRANT) box add --name $(BOX_NAME) $(PACKER_OUTPUT)
