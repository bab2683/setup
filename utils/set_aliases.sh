function join_by { local IFS="$1"; shift; echo "$*"; }
function explode_by () {
	echo "first parameter is $1"
	echo "second parameter is $2"

	local IFS=$1; read -r -a EXPLODED <<< $2
	echo "here"
	echo ${EXPLODED[@]}
	echo "$EXPLODED"
}



HOME_DIR="$(eval echo ~$USER)"
FILE_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

test=$(explode_by / ${FILE_DIR})

echo "my test is ${test}"


IFS='/' # Delimeter
read -ra EXPLODED_PATH <<< "$FILE_DIR" # Explode string into array
unset "EXPLODED_PATH[${#EXPLODED_PATH[@]}-1]" # Remove last element from array

ALIASES_CONFIG_PATH=$(join_by / ${EXPLODED_PATH[@]} config aliases.sh)



# echo "my path is ${ALIASES_CONFIG_PATH}"



# ALIASES=../config/aliases.sh






# FILENAME=".testrc"


# FILE="${HOME_DIR}/${FILENAME}"

# if test -f "$FILE"; then
# 	echo "exists"
# else
# 	echo "${FILENAME} file is not present, creating it now"
# 	$(cd $HOME_DIR && touch $FILENAME)
# 	echo "${FILENAME} created"
# fi


# echo $parent_path
# echo "$ALIASES" >> "$FILE"