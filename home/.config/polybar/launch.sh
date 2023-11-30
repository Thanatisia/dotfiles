
# Polybar Launch Script #
#=======================#

# Variables
	# Config
		POLYBAR_CONFIG_PATH=$HOME/.config/polybar
		POLYBAR_CONFIG_NAME=config.ini
		POLYBAR_CONFIG="$POLYBAR_CONFIG_PATH/$POLYBAR_CONFIG_NAME"

	# Bar
		POLYBAR_BAR_NAME="main"

# Starting Polybar
polybar --config=$POLYBAR_CONFIG $POLYBAR_BAR_NAME
