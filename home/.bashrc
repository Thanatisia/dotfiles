#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#=======#
# Setup #
#=======#
declare -A file_structure=(
	# Folders & File Structure Skeleton
	[personal]=~/personal
	[personal-scripts]=~/personal/scripts
	[personal-dotfiles]=~/personal/dotfiles/
)

declare -A files=(
	# All Dotfiles Here
	# Key : File Name
	# Value : Path + Name
    [shell-alias]=${file_structure["personal-scripts"]}/aliases
	[bashrc-personal]=${file_structure["personal-dotfiles"]}/bashrc-personal
	[scripts-extlib]=${file_structure["personal-scripts"]}/shellib.sh
)

: "
Create Folders if does not exist
" 
for fldr_name in "${!file_structure[@]}"; do
	fldrpath="${file_structure[$fldr_name]}"

	if [[ ! -d $fldrpath ]]; then
		# If folder is not found - create
		mkdir -p $fldrpath
	fi
done

: "
- Create Files if does not exist
- Source files if exist (or created)
" 
for filename in "${!files[@]}"; do
	filepath="${files[$filename]}"

	# Check if file exists
	if [[ ! -f $filepath ]]; then
		# File does not exist - create
		touch $filepath
	fi

	# Confirm if file exists
	if [[ -f $filepath ]]; then
		# File exists - source
		source $filepath
	fi
done

#=============================================#
# Graphical-required/xrandr-required packages #
#=============================================#
if [[ ! "$DISPLAY" == "" ]]; then
    declare -A xorg_sources=(
        [displayutil]=~/personal/scripts/displayutil.sh # Requires Graphical Environment & Display Server to use
    )
    for src_name in "${!xorg_sources[@]}"; do
        src_path="${xorg_sources[$src_name]}"
        if [[ -f $src_path ]]; then
            if [[ -x $src_path ]]; then
                # Executable
                source $src_path
     
                if [[ "$?" == "0" ]]; then
                    echo "[S] $src_path source success" >> /tmp/xorg_sources.log
                else
                    echo "[E] $src_path source error" >> /tmp/xorg_sources.log
                fi
            else
                echo "[E] $src_path Not Executable" >> /tmp/xorg_sources.log
            fi
        fi
    done
fi



#==========#
# Personal #
#==========#


