function join_by { local IFS="$1"; shift; echo "$*"; }
function split_by () { local arr=($(echo $2 | tr "$1" "\n")); echo ${arr[@]};}