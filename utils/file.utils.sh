# Params:
# 1: File path
function file_exists {
	if test -f "$1"; then
		echo true
	else
		echo false
	fi
}

# Params:
# 1: File path
# 2: Filename
function create_file(){
	$(cd $1 && touch $2)	
}

# Params:
# 1: Origin file
# 2: Target file
# 3: Is new
function copy_contents(){
	if ! $3; then
		echo "" >> "$2"
		echo "" >> "$2"
	fi
	cat $1 >> $2
}

# Params:
# 1: String to search
# 2: File path
function string_in_file() {
	local result=$(grep -F "$1" "$2" >/dev/null; echo $?)
	echo $result
}

# Params:
# 1: String to search
# 2: File path
function get_line_in_file() { 
	echo "$(grep -n "$1" "$2" | head -n 1 | cut -d: -f1)"
}

# Params:
# 1: Start line number
# 2: Finish line number
# 3: File path
function delete_content_in_range () {
	local FILE_WITHOUT_CONFIG=$(sed -e "${1},${2}d" "$3")
	echo "$FILE_WITHOUT_CONFIG" > $3
}

