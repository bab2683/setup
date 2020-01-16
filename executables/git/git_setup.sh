#!/usr/local/bin/bash

FILE_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $FILE_DIR 
source ../../constants/common.sh
source ../../utils/colors.utils.sh
source ../../utils/common.utils.sh
source ../../utils/file.utils.sh
source ../../utils/string.utils.sh

P1=$(colorize RED_BG Phase 1:)
P2=$(colorize BLUE_BG Phase 2:)
P3=$(colorize GREEN_BG Phase 3:)

# --------------------------
# Phase 1: Git completion
# --------------------------

GIT_COMPLETION_FILENAME=".git-completion.bash"
GIT_COMPLETION_FILE="${HOME_DIR}/${GIT_COMPLETION_FILENAME}"

echo "$P1 Checking for $(colorize YELLOW ${GIT_COMPLETION_FILENAME})"

if ! test -f $GIT_COMPLETION_FILE; then
	echo "$P1 $(colorize YELLOW ${GIT_COMPLETION_FILENAME}) missing, installing now"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o $GIT_COMPLETION_FILE
else
	echo "$P1 $(colorize YELLOW ${GIT_COMPLETION_FILENAME}) found"	
fi

echo "$P1 Completed"

# -------------------------------------------
# Phase 2: Check for existing configuration
# -------------------------------------------
echo "$P2 Checking for existing configuration"

# Params:
# 1: File path
# 2: Filename
# 3: Callback
# 4: Callback parameters
function second_phase_check_file (){
	if $(file_exists $1); then
		second_phase_check_configuration $1 $2
	else
		echo "$P2 $(colorize YELLOW $2) is not present, do you want to create it?"
		if $(yes_or_no); then
			create_file $HOME_DIR $2
			echo "$P2 $(colorize YELLOW $2) created"
			third_phase $1 $2 true
		else 
			shift
			shift
			if $(command_exists $1); then
				local command=$1
				shift
				"${command}" "$@"				
			fi			
		fi	
	fi
}

# Params:
# 1: File path
# 2: Filename
function second_phase_check_configuration (){
	echo "$P2 Looking for configuration in $(colorize YELLOW $2)"

	local GIT_CONFIG_START_STRING="Git configuration Start"
	local GIT_CONFIG_END_STRING="Git configuration End"
	
	# Check if config is present in file
	case $(string_in_file "$GIT_CONFIG_START_STRING" $1) in
	  0)
	    # if found, delete current configuration
		echo "$P2 Configuration found, deleting existing configuration"
		
		local START_CONFIG_LINE=$(get_line_in_file "$GIT_CONFIG_START_STRING" "$1")
		local LAST_CONFIG_LINE=$(get_line_in_file "$GIT_CONFIG_END_STRING" "$1")

		delete_content_in_range $START_CONFIG_LINE $LAST_CONFIG_LINE $1

		echo "$P2 Old configuration deleted in $(colorize YELLOW $2)"

		third_phase $1 $2 false
	    ;;
	  1)
		# code if not found
		third_phase $1 $2 false
	    ;;
	  *)
	    # code if an error occurred
	  	echo "$P2 Errors happened, aborting"
	    ;;
	esac
}

function second_phase_finish_without_changes {
	echo "$P2 Completed without changes"
}


# -----------------------------------
# Phase 3: Save Git configuration
# -----------------------------------
# Params:
# 1: File path
# 2: Filename
# 3: New file
function third_phase { 
	echo "$P2 Completed"	
	echo "$P3 Copying configuration into $(colorize YELLOW $2)"

	local EXPLODED_PATH=($(split_by / ${FILE_DIR})); # Parenthesis transform returned value into an array
	unset "EXPLODED_PATH[${#EXPLODED_PATH[@]}-1]"
	unset "EXPLODED_PATH[${#EXPLODED_PATH[@]}-1]"
	local GIT_CONFIG_PATH="/$(join_by / ${EXPLODED_PATH[@]} config git.config.sh)"

	copy_contents $GIT_CONFIG_PATH $1 $3

	echo "$P3 Configuration saved in $(colorize YELLOW $2)"
	
	echo "$P3 All you need to do now is to run this command in the terminal: $(colorize YELLOW 'source' $1) or $(colorize YELLOW 'source ~/'$2)"

	echo "$P3 Completed"
}

# -----------------------------------
# 				INIT
# -----------------------------------
BASH_PROFILE_NAME=".bash_profile"
BASH_PROFILE="${HOME_DIR}/${BASH_PROFILE_NAME}"

BASHRC_NAME=".bashrc"
BASHRC="${HOME_DIR}/${BASHRC_NAME}"

second_phase_check_file $BASH_PROFILE $BASH_PROFILE_NAME second_phase_check_file $BASHRC $BASHRC_NAME second_phase_finish_without_changes