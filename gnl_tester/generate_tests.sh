#!/bin/bash
export LC_ALL=C;
for n in {1..100}; do
	xxd -l $((RANDOM % 1024 + 1)) < /dev/urandom | cut -c 52- | tr -d '\n.' | tr '@' '\n' > tests/file$( printf %03d "$n").txt;
	echo '' >> tests/file$( printf %03d "$n").txt;
done
