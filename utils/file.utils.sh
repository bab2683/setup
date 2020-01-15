# Params:
# 1: File path
# 2: Filename
# 3: Target Directory
# 4: Callback
# 5: Callback parameters
function check_and_create_file(){
	if ! test -f "$1"; then
		echo "$2 is not present, do you want to create it?"
		select yn in "Yes" "No"; do
			case $yn in
				Yes ) create_file $3 $2; check_and_execute_command $4 $5 $1 true; break;;
				No ) break;;
			esac	
		done
	else
		check_and_execute_command $4 $5 $1
	fi	
}

function create_file(){
	$(cd $1 && touch $2)
	echo "${1}/${2} created"
}

function check_and_execute_command() {
	command=$1
	shift
	if ! test -z "$command"; then
		"${command}" "$@"
	fi
}
# Params:
# 1: Origin file
# 2: Target file
# 3: Is new
function copy_contents(){
	if test -z "$3"; then
		echo "" >> "$2"
		echo "" >> "$2"
	fi
	cat $1 >> $2
	echo "All aliases have been saved in ${2}"
	echo -e "Don't forget to run this command: $(colorize RED_BG source) to apply the new changes"	
}