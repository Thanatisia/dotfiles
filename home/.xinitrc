# XINITRC


#====================#
# Autostart Programs #
#====================#

### X Server Graphical Environment ###
# xsetroot -name " " &
# xrdb -load ~/.Xresources &
xrandr --output Virtual-1 --mode 1920x1080

### Components ###
picom & ### Compositor ###
conky & ### System Monitor ###
dunst & ### Notification Daemon ###
# nitrogen --restore # Wallpaper Setter
feh --bg-fill ~/Pictures/JPG/wallhaven-e7qmx8.jpg & # Wallpaper Setter

#=========#
# Startup #
#=========#

: "
Process Environment
"
DEFAULT_ENV="bspwm"
SESSION="${1:-$DEFAULT_ENV}"	# Take in first argument, default to bspwm
case $SESSION in
	"bspwm")	
		exec bspwm
		;;
	*)
		# Default
        exec "$SESSION"
		;;
esac

