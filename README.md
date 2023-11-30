# My Dotfiles

Contains various config files (aka 'dotfiles') for ricing and general use.

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [Remarks](#remarks)
- [References](#references)

## Information

### Currently Available Branches
+ general : To contain any generic, non-application/distribution-specific rice or configuration

### Planned Branches/Profiles
+ arch    : To contain dotfiles for my ArchLinux profiles
+ debian  : To contain dotfiles for my Debian profiles
+ gentoo  : To contain dotfiles for my Gentoo profiles
+ nvim    : To contain dotfiles for my NeoVim profiles
+ termux  : To contain dotfiles for my Tmux profile

## Quickstart Reference
### How to use?
- The repository is separated into an 'branch isolation' environment system, where each branch (excluding 'generic/general'), will contain profiles for a specific platform, software and/or distribution.
    - Please refer to [Currently available branches](#currently-available-branches) for a full list of branches (which will contain dotfiles for a platform, software and/or distribution)

- Clone the repository 
    - Specific branch/profile
        ```console
        git clone https://github.com/Thanatisia/dotfiles --branch=[branch-name]
        ```

- Movements
    - git CLI utility
        - To fetch and obtain all branches
            ```console
            git fetch
            ```
            - (Optional) Merge changes
                ```console
                git merge
                ```
        - To switch branches
            ```console
            git switch [target-branch]
            ```
    - Remote Repository Server WebUI
        - GitHub
            - Select on the 'branch' drop-down list next to the word 'branches'
            - Select the branch of your choice
                + The branch corresponds to the profile you wish to obtain the dotfiles of

## Setup

## Documentation

## Wiki

## Resources

## References

## Remarks
