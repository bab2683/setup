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
- `> filename`: deletes all content from file

## Debugging
```bash
set -x

command_you_want_to_debug

set +x
```

## Functions
- `split_by`: splits string using the given delimeter
```bash
# Location: utils/string.utils.sh

# Parameters:
# - char to look for to split the string
# - string 

# Returns array<any>

# Usage
FILE_DIR="users/test"
# It is wrapped into parentheses to get an array, otherwise you get the last value of the array
EXPLODED_PATH=($(split_by / ${FILE_DIR}))

# ("users" "test")
```
- `join_by`: joins string using the given char
```bash
# Location: utils/string.utils.sh

# Parameters:
# - char to use to join the string
# - string to split

# Returns string

# Usage

ARRAY=("users" "test")
ANOTHER_STRING="bla"
EXPLODED_PATH="/$(join_by / ${ARRAY[@]} ${ANOTHER_STRING})"
# /users/test/bla
```

- `colorize`: gives color to the string received
```bash
# Location: utils/color.utils.sh

# Parameters:
# - Color
# - String to parse

# Returns string

#Usage
colorize RED_BG Some text
```

- `file_exists`: gives color to the string received
```bash
# Location: utils/file.utils.sh

# Parameters:
# - File path

# Returns boolean

#Usage
file_exists my_file.txt
```

- `create_file`: creates file in given location
```bash
# Location: utils/file.utils.sh

# Parameters:
# - Target directory
# - File name

#Usage
create_file /files my_file.txt
```

- `copy_contents`: copy contents from one file and appends to another.
```bash
# Location: utils/file.utils.sh

# Parameters:
# - Origin file
# - Target file
# - Is new

#Usage
copy_contents /files/test.sh /files/test-2.sh true
```

- `string_in_file`: check if a given string is present in file
```bash
# Location: utils/file.utils.sh

# Parameters:
# - String to search
# - File path

# Returns 0 if yes, 1 if no, another if there are errors

#Usage
string_in_file "my string" /files/test.sh
```

- `get_line_in_file`: returns first line number of requested string
```bash
# Location: utils/file.utils.sh

# Parameters:
# - String to search
# - File path

# Returns string

#Usage
get_line_in_file my-string /files/test.sh
```

- `delete_content_in_range`: deletes content between two given line numbers
```bash
# Location: utils/file.utils.sh

# Parameters:
# - Start line
# - Finish line
# - File path


#Usage
delete_content_in_range 2 16 /files/test.sh
```

- `yes_or_no`: prompts a `yes` or `no` form
```bash
# Location: utils/common.utils.sh

# Returns boolean

#Usage
yes_or_no
```

- `command_exists`: check is given command exists
```bash
# Location: utils/common.utils.sh

# Parameters:
# - Command to check

# Returns boolean

#Usage
command_exists my_function
```
