#!/bin/env bash

<<EOF
The X Initialization Resource Control File (.xinitrc) for xorg xinit
EOF

### Variables ###
declare -A monitors=(
	[Virtual-1]="--mode 1920x1080"
)

### Autostart ###

# --- Display
for monitor in "${!monitors[@]}"; do
	monitor_specs="${monitors[$monitor]}"
	xrandr --output $monitor $monitor_specs
done

### Graphical Environment ###

opt="${1:-bspwm}"
exec_cmd=""
case "$opt" in
	"bspwm")
		exec_cmd="exec bspwm"
		;;
	*)
		exec_cmd="exec $opt"
		;;
esac

echo -e "(O) Running $exec_cmd..."
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	$exec_cmd && (
		echo -e "(D) Successfully ran $exec_cmd"
	) || (
		echo -e "(X) Error running $exec_cmd"
	)
fi
