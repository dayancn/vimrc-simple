#!/bin/sh
# generate database for lookupfile.vim plugin.
# It will be call by vim with the hotkey <F7>.

if [ "$1" != "" ]; then
	echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > "$1"
	#find . -not -wholename '*.svn*' -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | sort -f >> "$1"
	find . \( \
		-name "*.[hcsS]" -o \
		-name "*.js"     -o \
		-name "*.lua"    -o \
		-name "*.cpp"    -o \
		-name "*.txt"    -o \
		-name "*.def"    \) \
		-printf "%f\t%p\t1\n" | sort -f >> "$1"
fi
