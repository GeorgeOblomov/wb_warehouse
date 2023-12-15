# Defining variables for all scripts
SCRIPTS_DIR := scripts
CODEGEN_SCRIPT := $(SCRIPTS_DIR)/build_runner.sh

# Tasks to run each script
codegen:
	sh $(CODEGEN_SCRIPT)

# By default, we display a message about available tasks
help:
	@echo "Available tasks:"
	@echo " - codegen: build_runner build & dart format 120"
