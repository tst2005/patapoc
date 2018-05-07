#!/bin/bash

if ( printf -v xxx '%q' 'a \'"' b"; eval "xx=$xxx"; [ "$xx" = "a\ \\\'\ b" ]); then
	echo >&2 "bash required"
	exit 1
fi

# ================================================================
if false; then

x=''
qlist() {
	local a1="$1";shift
	eval "set -- $1"
	printf '%q ' "$a1" "$@"
}
x="$(qlist 'foo " bar' "$x")"
x="$(qlist 'buz' "$x")"
echo "x=$x"
t() {
	eval "set -- $1"
	echo $#
	for v in "$@"; do
		echo " - $v"
	done
}
t "$x"
exit
fi
# =======================================================

packn() {
	local n="$1";shift;
	args=''
	for _i in $(seq 1 $n); do
		#printf -v q1 '%q' "$1"
		args="${args:+$args }$(printf '%q' "$1")"
		shift
	done
}
checkargs() {
	# echo "receive cmd=$1 args=$2"

	local cmd="$1"
	eval "set -- $2"

	echo "cmd=$cmd (size=$#)"
	for a in "$@"; do
		echo " - $a"
	done
}
execcmd() {
	eval "$1" "$2"
}
execcmd2() {
	local cmd="$1"
	eval "set -- $2"
	"$cmd" "$@"
}
onelinepoc() {
	local allpacks=''
	local args='' cmd=''
	while [ $# -gt 0 ]; do
		local n="$1";shift
		if [ "$n" = "0" ]; then continue; fi
		args=''
		packn 1 "$1"
		cmd="$args"
		shift;n=$(( $n - 1 ))
		packn "$n" "$@"
		shift "$n"
		allpacks="${allpacks:+$allpacks }$args
		#checkargs "$cmd" "$args"
		execcmd2 "$cmd" "$args"
	done
}
echo "onelinepoc 2 echo 'hello world' 0 4 echo hello world '!'"
onelinepoc 2 echo 'hello world' 0 4 echo hello world '!'
