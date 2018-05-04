. ./poc3.lib.sh

USE() { IN "$@"; }
FROM() { GET "$@"; }
WHERE() { FILTER "$@"; }
SELECT() { CONVERT "$@"; }
ORDERBY() { CONVERT ':'; GET output "$@"; }
