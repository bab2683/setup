function join_by { local IFS="$1"; shift; echo "$*"; }
function explode_by () { local arr=($(echo $2 | tr "$1" "\n")); echo ${arr[@]};}

HOME_DIR="$(eval echo ~$USER)"
FILE_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
EXPLODED_PATH=($(explode_by / ${FILE_DIR})) # Parenthesis transform returned value into an array

unset "EXPLODED_PATH[${#EXPLODED_PATH[@]}-1]" # Remove last element from array
ALIASES_CONFIG_PATH="/$(join_by / ${EXPLODED_PATH[@]} config aliases.sh)"

FILENAME=".bashrc"
FILE="${HOME_DIR}/${FILENAME}"

if ! test -f "$FILE"; then
	echo "${FILENAME} does not exist, creating it now"
	$(cd $HOME_DIR && touch $FILENAME)
	echo "${FILENAME} created"
fi

if ! test -f "$ALIASES_CONFIG_PATH"; then
	echo "${ALIASES_CONFIG_PATH} doesn't exist"
	exit
fi

echo "" >> "$FILE"
echo "" >> "$FILE"
cat $ALIASES_CONFIG_PATH >> $FILE

echo "All aliases have been saved in ${FILENAME}"

source $FILE