# 
# A modular, portable and customizable Out-of-the-Box (OOTB) makefile template
#
# :: Usage
#	make about 				: Displays the project information
#	make backup				: Backup target system
# 	make build 				: To download all files and run the full customization and configuration process
#	make clean	 			: Clean and removes all temporary files
# 	make configure 			: To configure your currently found files
# 	make download 			: To download the files only
#	make help 				: Prints this help menu
# 	make install			: Runs the script in the correct order and install the program; Please run this in sudo
#	make setup				: Prepare system for script use

#============
# Variables
#============
PROJ_NAME = Install_Dotfiles		# Project Name
PROJ_FLDR = $(PWD)/$(PROJ_NAME) 	# Project Folder
BASE  = $(PROJ_FLDR)
SYMLINKS_SRC = config .local .vim personal .bashrc .bash_profile .inputrc .xinitrc .tmux.conf
SYMLINKS_DEST = ~/.config ~/.local ~/.vim ~/personal ~/.bashrc ~/.bash_profile ~/.inputrc ~/.xinitrc ~/.tmux.conf

#==========
# Commands
#==========
MKDIR = mkdir -p
LN = ln -vsrf 		# Symbolic Link Files
LNDIR = ln -vsr 	# Symbolic Link Directory
TAR_COMPRESS = sudo tar -cvzf
TAR_EXTRACT = sudo tar -xvzf

#=========
# Recipes
#=========

.PHONY: setup install clean help

.DEFAULT_GOAL := help	# Run ':help' if no target/action is provided

listsrc: ## List all source
	@for src in $(SYMLINKS_SRC); do
		if [[ @test -d $$src ]]; then
			# is Directory
			echo "$$src : Directory"
		else if [[ @test -f $$src ]]; then
			# is File
			echo "$$src : File"
		fi
	done

listdst: ## List all destination targets
	@for dst in $(SYMLINKS_DEST); do
		if [[ @test -d $$dst ]]; then
			# is Directory
			echo "$$dst : Directory"
		else if [[ @test -f $$dst ]]; then
			# is File
			echo "$$dst : File"
		fi
	done

setup:
	## Prepare System for script use

install:
	## Begin Symlink of the dotfiles and folders into the respective locations
	@for src in $(SYMLINKS_SRC); do 
		for dst in $(SYMLINKS_DEST); do
			echo "Mapping Symbolic Link $(src) => $(dst)..."
			if [[ @test -d $$src ]]; then
				# Directory
				$(LNDIR) $$src $$dst;
			else if [[ @test -f $$src ]]; then
				# File
				$(LN) $$src $$dst;
			fi
		done
	done
	
clean:
	## Removes all existing symlinks in the target destination
	echo "Deleting Symbolic Links [$(SYMLINKS_DEST)]..." 
	rm $(SYMLINKS_DEST)

help:
	## Prints this help menu
	# Will search for all '##' in each recipe and
	# Write that out in the help menu
	# Reference: Gavin Freeborn | How to manage your dotfiles with make | https://www.youtube.com/watch?v=aP8eggU2CaU
	@grep -E '^[a-ZA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


