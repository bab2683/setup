function yes_or_no {
	select yn in "Yes" "No"; do
		case $yn in
			Yes ) echo true; break;;
			No ) echo false; break;;
		esac	
	done
}

# Params:
# 1: Command to check
function command_exists {
	if ! test -z "$1"; then
		echo true
	else
		echo false
	fi
}