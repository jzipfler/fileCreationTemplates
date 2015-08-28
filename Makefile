GLOBAL_INSTALL_DIR=/usr/local/share/fileCreationTemplate
USER_INSTALL_DIR=${HOME}/.local/share/fileCreationTemplate

CURRENT_USER=$(shell whoami)
ifeq ("$(CURRENT_USER)", "root")
	INSTALL_DIR=$(GLOBAL_INSTALL_DIR)
	PATH_DIR=/usr/local/bin
else
	INSTALL_DIR=$(USER_INSTALL_DIR)
	PATH_DIR=$(HOME)/bin
endif

info:
	@echo "Use 'make install' to install this program to your computer."
	@echo "Install is needed, because the program looks for the template folder."
	@echo ""
	@echo "If you want to install the program to an other directory,"
	@echo "you can modify the related INSTALL_DIR variable in the script."

install:
	@echo "Installing templates to $(INSTALL_DIR)"
	@mkdir -pv $(INSTALL_DIR)
	@cp -rv templates $(INSTALL_DIR)
	@echo ""
	@echo "Installing executable to $(PATH_DIR)"
	@mkdir -pv $(PATH_DIR)
	@cp -v new $(PATH_DIR)

.PHONY: clean
clean:
	@rm -rfv $(INSTALL_DIR)
	@rm -fv $(PATH_DIR)/new
