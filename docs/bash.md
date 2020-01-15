# Bash essentials

## Useful snippets
- **Multiple choice**: 
```bash
select yn in "Yes" "No"; do
  case $yn in
    Yes ) do_something; break;;
    No ) do_something_else; break;;
  esac	
done
```
- **Check file existence**:
```bash
if !test -f "$FILENAME"; then
  echo "${FILENAME} exists"
else
  echo "${FILENAME} doesn't exists"
fi  
```
- **Append contents from one file to another**:
```bash
cat $ORIGIN_FILE >> $DESTINATION_FILE
```
- **Get home directory of current user**:
```bash
HOME_DIR="$(eval echo ~$USER)"
```
- **Get directory of current file**:
```bash
FILE_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
```
- **Change color of string**:
```bash
YELLOW='\033[1;33m'
RESET_COLOR='\033[0m'

echo -e "This string is now ${YELLOW}yellow and ${RESET_COLOR}now is back to normal"
# Try for best results
```

- **Change file permissions to execute**:
```bash
# go to directory
cd /path/to/target
# change permissions
chmod +x the_file_name
```

## Useful commands
- `$?`: displays results of last executed command
- `source $FILE_DIR`: imports file
- `printenv`: show environment variables

## Functions
- `split_by`: splits string using the given delimeter
```bash
# Parameters:
# - char to look for to split the string
# - string 

# Usage
FILE_DIR="users/test"
# It is wrapped into parentheses to get an array, otherwise you get the last value of the array
EXPLODED_PATH=($(split_by / ${FILE_DIR}))

# ("users" "test")
```
- `join_by`: joins string using the given char
```bash
# Parameters:
# - char to use to join the string
# - string to split

# Usage

ARRAY=("users" "test")
ANOTHER_STRING="bla"
EXPLODED_PATH="/$(join_by / ${ARRAY[@]} ${ANOTHER_STRING})"
# /users/test/bla
```