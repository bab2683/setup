function parse_color { echo "\033[$1m";}

# Params:
# 1: Color
# 2: String
function colorize(){
	local color=${COLORS[$1]}
	shift;
	echo -e "${color}${@}${RESET_COLOR}";
}

declare -A COLORS
COLORS[RED_BG]=$(parse_color "41")
COLORS[GREEN_BG]=$(parse_color "42")
COLORS[BLUE_BG]=$(parse_color "44")
COLORS[YELLOW]=$(parse_color "1;33")

RESET_COLOR=$(parse_color "0")
