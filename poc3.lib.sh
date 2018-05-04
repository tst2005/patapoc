load() { . ./${NAMESPACE:+$NAMESPACE/}$1; }

IN() {
	NAMESPACE="$1";
}

GET() {
	# GET <name> input
	if [ $# -eq 2 ] && [ "$2" = "input" ]; then
		load inputs
		"$1"
		return $?
	fi
	case "$1" in
		(output)
			load output
			shift
		;;
		(input)
			load inputs
			shift
		;;
		(stdin|-)
			if [ $# -ne 1 ]; then
				echo >&2 "Wrong syntax: stdin does not support additionnal argument"
				return 1
			fi
			cat
			return 0
		;;
		(*)
			load inputs
			if ! command >/dev/null 2>&1 -v "$1"; then
				echo >&2 "ERROR"
				return 1
			fi
		;;
	esac
	DefaultOrChain "$@"
}

Chain() {
	if [ $# -gt 1 ]; then
		local a1="$1";shift
		Chain "$a1" | Chain "$@";
		return $?
	fi
	if [ "$1" != : ]; then
		"$1";
	fi
}

DefaultOrChain() {
	if [ $# -eq 0 ]; then
		default
		return $?
	fi
	Chain "$@"
}

FILTER() {
	load filters
	DefaultOrChain "$@"
}

CONVERT() {
	load convert
	DefaultOrChain "$@"
}

OUTPUT() {
	GET output "$@"
}
