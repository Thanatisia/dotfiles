### Makefile for Dotfile Management ###

# [Variables]

# Dotfiles
DOT_CONFIG = ~/.config
DOT_HOME = ~

# Package Management
REPO_RESOURCES_DIR = res
REPO_HOME_DIR = home
REQUIREMENTS = res/requirements.txt
PKG_MGR = pacman
PKG_INSTALL = pacman -S
PKG_UPDG = pacman -Syu
PKG_REMOVE = pacman -Rsu

# [Recipes]
setup: ## Setup workspace filesystem structure
	# Create config folders
	@test -d $(DOT_CONFIG) || mkdir -p $(DOT_CONFIG)

	# Install dependencies and packages
	$(PKG_INSTALL) < $(REQUIREMENTS)

start: setup
	# Symlink files
	# -s : Create a symbolic link (symlink)
	# -r : Make relative path link
	# -f : Force replace if file/folder exists
	ln -srf .bashrc 		$(DOT_HOME)/.bashrc
	ln -srf .bash_profile 	$(DOT_HOME)/.bash_profile
	ln -srf .xinitrc 		$(DOT_HOME)/.xinitrc

	# Symlink directories
	# -s : Create a symbolic link (symlink)
	# -p : Make physical/hard path link
	# -f : Force replace if file/folder exists
	ln -spf .config 	$(DOT_HOME)/.config
	ln -spf .vim 		$(DOT_HOME)/.vim
	ln -spf personal 	$(DOT_HOME)/personal


