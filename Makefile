#=================================#
# Makefile for Dotfile Management #
#=================================#

# [Variables]
SHELL = /bin/bash # EDIT THIS
CC = cc
DOTFILES = $(.config .bashrc .bashrc.personal .profile .vim .xinitrc .zshrc)

# [Ingredients]

#[Recipes]

.PHONY: ## Set Default Recipe to run
    help

help: ## Help Menu
    echo install;
    echo clean;
    echo help;

install: ## Create symlinks of all directories in repositories into => .config or relevant sections in the user
    @for files in $(dotfiles); do \
        # Check if files exist
        if [[ ! -f $$files ]]; do \
            touch $$files; \
        fi \

        ln -s -r $$files ~ \
	done
	# ln -s -r .config ~
	# ln -s -r .bashrc ~
	# ln -s -r .bashrc.personal ~
	# ln -s -r .profile ~
	# ln -s -r .vim ~
	# ln -s -r .xinitrc ~
	

clean: ## Delete all symlinks
    @for files in $(dotfiles); do \
	    rm ~/$$files \
    done
    # rm ~/.bashrc 
	# rm ~/.bashrc.personal 
	# rm ~/.config 
	# rm ~/.profile 
	# rm ~/.vim 
	# rm ~/.xinitrc
