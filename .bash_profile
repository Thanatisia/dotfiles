#
# ~/.bash_profile
#
# commands specified here will be ran only at the first instance of the shell being ran
# - i.e., the first time bash is called (if you are using the tty, and it is the default shell - it will be after the login screen)
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#===========#
# Functions #
#===========#
enable_services_if_not_active()
{
	: "
	Enable services if inactive
	"
	services=("$1")
	for service in "${services[@]}"; do
		# Loop through all services and check if system is active
		# Return Codes:
		#	-1 : Active
		#	Non-Zero : Inactive
		systemctl is-active --quiet $service
		ret_code="$?"
		if [[ ! "$ret_code" == "0" ]]; then
			# If not active (Status > -1) - Enable
			sudo systemctl start $service && \
				echo "$service has been enabled" || \
				echo "Error enabling $service..."
		fi
	done
}


#===============================#
# Autostart & First-time Enable #
#===============================#
services=(
	"NetworkManager"
)
enable_services_if_not_active "${services[@]}"


#==================#
# Starting Session #
#==================#
default_env="bspwm"
start_session="" # Default/Session of choice
conf=""	# Confirm Start

: "
Get user input & confirm start session
"
read -p "Session to start (Leave empty for default): " start_session

if [[ "$start_session" == "" ]]; then
	start_session=$default_env
fi

: "
Confirm start session
"
read -p "Confirm start session [$start_session]? {Y(y) | N} : " conf

if [[ "$conf" == "Y" ]] || [[ "$conf" == "y" ]]; then
	startx ~/.xinitrc $start_session
	# startx $start_session
else
	# No
	echo -e "Type 'startx ~/.xinitrc {your_session}' to start"
fi


