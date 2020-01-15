#!/usr/local/bin/bash

FILE_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $FILE_DIR 
source ../constants/common.sh
source ../utils/colors.utils.sh
source ../utils/file.utils.sh
source ../utils/string.utils.sh

# --------------------------
# Phase 1: Git completion
# --------------------------

GIT_COMPLETION_FILENAME=".git-completion-test-2.bash"
GIT_COMPLETION_FILE="${HOME_DIR}/${GIT_COMPLETION_FILENAME}"

echo $GIT_COMPLETION_FILE

echo "$(colorize RED_BG Phase 1:) Checking for $(colorize YELLOW ${GIT_COMPLETION_FILENAME})"

if ! test -f $GIT_COMPLETION_FILE; then
	echo "$(colorize RED_BG Phase 1:) $(colorize YELLOW ${GIT_COMPLETION_FILENAME}) missing, installing now"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o $GIT_COMPLETION_FILE
else
	echo "$(colorize RED_BG Phase 1:) $(colorize YELLOW ${GIT_COMPLETION_FILENAME}) found"	
fi

echo "$(colorize RED_BG Phase 1:) Completed"

# -----------------------------------
# Phase 2: Save Git configuration
# -----------------------------------

EXPLODED_PATH=($(split_by / ${FILE_DIR})); # Parenthesis transform returned value into an array
unset "EXPLODED_PATH[${#EXPLODED_PATH[@]}-1]" # Remove last element from array
GIT_CONFIG_PATH="/$(join_by / ${EXPLODED_PATH[@]} config git.config.sh)"

BASH_PROFILE_NAME=".bash_profiles"
BASH_PROFILE="${HOME_DIR}/${BASH_PROFILE_NAME}"

BASHRC_NAME=".bashrc"
BASHRC="${HOME_DIR}/${BASHRC_NAME}"

FILENAME=".bashrc"
FILE="${HOME_DIR}/${FILENAME}"

check_and_create_file $BASH_PROFILE $BASH_PROFILE_NAME $HOME_DIR copy_contents $GIT_CONFIG_PATH