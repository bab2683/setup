function join_by { local IFS="$1"; shift; echo "$*"; }
function explode_by () { local arr=($(echo $2 | tr "$1" "\n")); echo ${arr[@]};}
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
	source $2
}

HOME_DIR="$(eval echo ~$USER)"
FILE_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
EXPLODED_PATH=($(explode_by / ${FILE_DIR})) # Parenthesis transform returned value into an array

unset "EXPLODED_PATH[${#EXPLODED_PATH[@]}-1]" # Remove last element from array
ALIASES_CONFIG_PATH="/$(join_by / ${EXPLODED_PATH[@]} config aliases.sh)"

BASH_PROFILE_NAME=".bash_profile"
BASH_PROFILE="${HOME_DIR}/${BASH_PROFILE_NAME}"

BASHRC_NAME=".bashrc"
BASHRC="${HOME_DIR}/${BASHRC_NAME}"

FILENAME=".bashrc"
FILE="${HOME_DIR}/${FILENAME}"

check_and_create_file $BASH_PROFILE $BASH_PROFILE_NAME $HOME_DIR copy_contents $ALIASES_CONFIG_PATH