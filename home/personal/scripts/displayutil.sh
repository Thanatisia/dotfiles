: "
Display Management
"
# Source Libraries
. $PWD/personal/scripts/shellib.sh

available_resolutions=(
	# Automatically detect and retrieve all available resolutions in primary monitor
	# Remove Leading Whitspace from xrandr output string
	`xrandr | grep -v -e "Virtual" -e "Screen" | sed -e 's/^[[:space:]]*//' | cut -d ' ' -f1`
)
sorted_avail_resolutions=(`sort_array ${available_resolutions[@]}`)

list_resolution()
{
	: "
	List all resolution
	"
	for i in "${!sorted_avail_resolutions[@]}"; do
		echo "[$i] => [${sorted_avail_resolutions[$i]}]"
	done
}

get_max_resolution()
{
    : "
    Get the biggest resolution (last element)
    "
    echo -e "${sorted_avail_resolutions[-1]}"
}

get_mean_resolution()
{
    : "
    Get middle/center resolution (half)
    "
    number_of_resolutions="${#sorted_avail_resolutions[@]}"
    echo -e "${sorted_avail_resolutions[$((number_of_resolutions/2))]}"
}

get_min_resolution()
{
    : "
    Get the smallest resolution
    "
    echo -e "${sorted_avail_resolutions[0]}"
}

get_resolution_pos()
{
    : "
    Search for Position Index of resolution
    "
    target_resolution="$1"
    index=0
    is_available=0

    for i in "${!sorted_avail_resolutions[@]}"; do
        res="${sorted_avail_resolutions[$i]}"
        if [[ "$res" == "$target_resolution" ]]; then      
            index=$i
            is_available=1
            break
        fi  
    done
    
    if [[ "$is_available" == "1" ]]; then
        echo -e "$index"
    else
        echo -e "Not Available"
    fi
}


switch_resolution()
{
	: "
	Change Resolution
	"
	# Variables
	resolution=${1:-""}
	curr_monitor_resolution=`xrandr | grep 'primary' | cut -d ' ' -f4 | cut -d '+' -f1`
	curr_monitor_output=`xrandr | grep 'primary' | cut -d ' ' -f1`

	# Default Check
	if [[ "$resolution" == "" ]]; then
		echo "Current Output Resolution: $curr_monitor_resolution" 
		read -p "New Output Resolution: " resolution
	fi

	# Set Global Variables
	MONITOR=$curr_monitor_output
	RESOLUTION=$resolution

	# Change Resolution If not empty
	if [[ "$resolution" == "" ]]; then
		echo "Resolution unchanged."
	else
		xrandr --output $curr_monitor_output --mode $resolution
	fi
}


prev_resolution()
{
	: "
	Switch to the previous resolution in the list
	"
	# Variables
	number_of_resolutions="${#sorted_avail_resolutions[@]}"
	curr_monitor_resolution=`xrandr | grep 'primary' | cut -d ' ' -f4 | cut -d '+' -f1`
	curr_monitor_output=`xrandr | grep 'primary' | cut -d ' ' -f1`
	index=$number_of_resolutions

	# Get index of element in array
	for i in "${!sorted_avail_resolutions[@]}"; do
		curr_resolution="${sorted_avail_resolutions[$i]}"

		# Check If current resolution is
		# your current resolution
		if [[ "$curr_resolution" == "$curr_monitor_resolution" ]]; then
			# Index found
			index=$i
			break
		fi
	done

	# Loop through list and if hit the end
	# Return back to 0
	if [[ "$index" == $((number_of_resolutions+1)) ]]; then
		# Hit the max
		# Reset back to 0
        next_index=$number_of_resolutions
	else
		# Get next index in the list
		next_index=$((index-1))
	fi

	# Get next resolution in the list
	next_resolution="${sorted_avail_resolutions[$next_index]}"
    
    echo "$next_index => $next_resolution"

	# Change resolution
	xrandr --output $curr_monitor_output --mode $next_resolution
}

next_resolution()
{
	: "
	Switch to the next resolution in the list
	"

	# Variables
	number_of_resolutions="${#sorted_avail_resolutions[@]}"
	curr_monitor_resolution=`xrandr | grep 'primary' | cut -d ' ' -f4 | cut -d '+' -f1`
	curr_monitor_output=`xrandr | grep 'primary' | cut -d ' ' -f1`
	index=0

    : "
    Search for index of current resolution
    "
	# Get index of element in array
	for i in "${!sorted_avail_resolutions[@]}"; do
		curr_resolution="${sorted_avail_resolutions[$i]}"

		# Check If current resolution is
		# your current resolution
		if [[ "$curr_resolution" == "$curr_monitor_resolution" ]]; then
			# Index found
			index=$i
            break
		fi
	done

    : "
    Get next index 
    "
	# Loop through list and if hit the end
	# Return back to 0
	if [[ "$index" == $((number_of_resolutions-1)) ]]; then
		# Hit the max
		# Reset back to 0
		next_index=0
	else
		# Get next index in the list
		next_index=$((index+1))
	fi

	# Get next resolution in the list
	next_resolution="${sorted_avail_resolutions[$next_index]}"

    echo "$next_index => $next_resolution"
	
    # Change resolution
	xrandr --output $curr_monitor_output --mode $next_resolution
}
