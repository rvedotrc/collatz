#!/bin/sh
set -e
set -x

(
	echo "digraph collatz {"
	./collatz3.pl | head -1000
	echo "}"
) > collatz.dot

dot -Tpng -o collatz.png collatz.dot
dot -Tsvg -o collatz.svg collatz.dot

