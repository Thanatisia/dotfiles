#!/bin/bash

: "
 Autostart
"
conky &
sxhkd &
xrandr --output HDMI-1 --mode 1920x1080 & # Set Monitor Output [1] => Resolution: 1920x1080

: "
 Select & Start sessions
"
DEFAULT_ENV="bspwm"
declare -a list_of_env=(
	[bspwm]="bspwm"
)

SESSION="${1:-$DEFAULT_ENV}"
exec ${list_of_env["$SESSION"]}
