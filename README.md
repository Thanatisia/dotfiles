# My Dotfiles

Contains various config files (aka 'dotfiles') for ricing and general use.

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [Remarks](#remarks)
- [References](#references)
- [Notes](#notes)

## Information

These are my general configuration files


### General Updates

- 2022-04-27 1658H : 
    - at the moment this is my system config
        - Distribution : ArchLinux (Base)
        - Display Server : XOrg
        - Graphical Environment Type : Window Manager
        - Graphical Environment : BSPWM
        - Font : Hack Nerd Font 
        - Terminal Emulator : Alacritty (considering on moving to kitty)
        - Status Bar : Lemonbar

## Setup

### Pre-Requisites

+ git

### Dependencies

- Official Repository
    + base-devel
    + bspwm
    + feh
    + imagemagick
    + sxhkd
    + xautolock
    + xdotool
- Community
    - AUR
        + [lemonbar-xft](https://aur.archlinux.org/lemonbar-xft-git.git)

### Obtaining

```console
git clone https://github.com/Thanatisia/dotfiles
```

### Installing/Compilation/Build

```
I am currently working on a Makefile/shellscript for easy installation
```

- Manual Steps 
    - Copy/Move config files into their relevant directories
        ```
        Tip n Tricks:
        - Use symlink (ln -s -r) to virtually/symbolically make a copy of the folder and paste it into the target directory
            - Anything that is changed within the $HOME directory, and/or wherever you symlinked to will change the original folder (git repo)
            - This way, you do not need to worry about manually copy and pasting to and from the folders
        ```
        - Using symlink
            ```console
            ### Synopsis/Syntax ###
            
            # Symbolic link a relative path to the folder to prevent recursive folder links
            # ln -s -r  <source_path> <destination_path>
            
            ln -s -r /path/to/git/repo/config ~/.config
            ln -s -r /path/to/git/repo/.local ~/.local
            ln -s -r /path/to/git/repo/.vim ~/.vim
            ```

### Setup/Preparation



## Documentation

### Screenshots

![Rice Screenshot](https://github.com/Thanatisia/dotfiles/blob/main/assets/rice_screenshot.png?raw=true)

### Customization and Configuration


## Resources


## Remarks

## References

