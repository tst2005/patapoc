
set -e
( shopt -s expand_aliases ) 2>/dev/null && shopt -s expand_aliases || true



# for bash, enable aliases for non-interactive shell
#( shopt -s expand_aliases; ) 2>/dev/null && shopt -s expand_aliases || true

#alias foo='echo 123'



alias foo=ALIASED_foo
alias bar=ALIASED_bar

ALIASED_foo() {
	echo FooOK;
	echo BarKO
}
ALIASED_bar() {
	grep 'OK'
}

foo | bar
