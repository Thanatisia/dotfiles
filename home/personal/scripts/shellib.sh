#======================#
# External Library for #
# Linux Shellscripting #
#======================#

: "
Array Utilities
"
conv_list_to_str()
{
	: "
	Convert a list to string
	"
	echo "$*"
}
sort_array()
{
	: "
	Sort an array

	Steps:
		1. Take in array
		2. Convert list to a string
		3. Return the string to caller

	Example:
 		# Sort the array by its seperator
		IFS=$'\n' sorted=(\$(sort <<< \"\${arr[*]}\"))
		unset IFS
	Usage:
		1. Convert the string into an array
			out_arr=(\`sort_array \${dataset[@]}\`)
	"
	# Create and use nameref for indirection (populate the named array indirectly)
	arr=($@)
    params="-g"

	IFS=$'\n' sorted=($(sort $params <<< "${arr[*]}"))
	unset IFS

	sorted_str=`conv_list_to_str ${sorted[@]}`
	echo "$sorted_str"
}

get_arr_index()
{
	: "
	Get index of keyword in the array
	"
	arr=("$1")
	target="$1"

	# Get index of element in array
	for i in "${arr[@]}"; do
		curr_element="${arr[$i]}"

		# Check If current element is
		# your target
		if [[ "$curr_element" == "$target" ]]; then
			# Index found
			# Break
			index=$i
			break
		fi
	done

	echo $index
}
