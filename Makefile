SHELL   := bash
PACKER  := packer
VAGRANT := vagrant
PACKER_OUTPUT := packer_virtualbox-iso_virtualbox.box
BOX_NAME := openbsd66

.DEFAULT_GOAL := $(PACKER_OUTPUT)

.PHONY : clean
clean :
	$(VAGRANT) destroy
	$(VAGRANT) box remove $(BOX_NAME)
	$(RM) $(PACKER_OUTPUT)

.PHONY : validate
validate : 
	$(PACKER) validate vagrant.json

$(PACKER_OUTPUT) : vagrant.json http/install.conf http/rc.firsttime scripts/bootstrap.sh
	$(PACKER) build vagrant.json
	$(VAGRANT) box add --name $(BOX_NAME) $(PACKER_OUTPUT)
