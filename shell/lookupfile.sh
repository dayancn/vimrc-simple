#!/bin/sh
# generate database for lookupfile.vim plugin.
# It will be call by vim with the hotkey <F6>.

if [ "$1" != "" -a ! -e "$1" ]; then
	echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > "$1"
	#find . -not -wholename '*.svn*' -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | sort -f >> "$1"
	#find . \( \
	#	-name "*.[hcsS]" -o \
	#	-name "*.js"     -o \
	#	-name "*.lua"    -o \
	#	-name "*.cpp"    -o \
	#	-name "*.txt"    -o \
	#	-name "*.def"    \) \
	#	-printf "%f\t%p\t1\n" | sort -f >> "$1"

	find ${PROJ_ROOT_PATH}  \
		-path "${PROJ_ROOT_PATH}/compatibility"                                                         -prune -o \
		-path "${PROJ_ROOT_PATH}/cts"                                                                   -prune -o \
		-path "${PROJ_ROOT_PATH}/dalvik"                                                                -prune -o \
		-path "${PROJ_ROOT_PATH}/developers"                                                            -prune -o \
		-path "${PROJ_ROOT_PATH}/development"                                                           -prune -o \
		-path "${PROJ_ROOT_PATH}/external/*" ! -path "${PROJ_ROOT_PATH}/external/wpa_supplicant_8*"     -prune -o \
		-path "${PROJ_ROOT_PATH}/hardware/*" ! -path "${PROJ_ROOT_PATH}/hardware/base*"                 -prune -o \
		-path "${PROJ_ROOT_PATH}/out"                                                                   -prune -o \
		-path "${PROJ_ROOT_PATH}/packages/*" ! -path "${PROJ_ROOT_PATH}/packages/apps*"                 -prune -o \
		-path "${PROJ_ROOT_PATH}/pdk"                                                                   -prune -o \
		-path "${PROJ_ROOT_PATH}/platform_testing"                                                      -prune -o \
		-path "${PROJ_ROOT_PATH}/prebuilts"                                                             -prune -o \
		-path "${PROJ_ROOT_PATH}/shortcut-fe"                                                           -prune -o \
		-path "${PROJ_ROOT_PATH}/test"                                                                  -prune -o \
		-path "${PROJ_ROOT_PATH}/toolchain"                                                             -prune -o \
		-path "${PROJ_ROOT_PATH}/tools"                                                                 -prune -o \
		\( \
		-name "*.[hcsS]" -o \
		-name "*.js"     -o \
		-name "*.cc"     -o \
		-name "*.cpp"    -o \
		-name "*.lua"    -o \
		-name "*.txt"    -o \
		-name "*.def"    -o \
		-name "*.aidl"   -o \
		-name "*.java"      \
		\) \
		-printf "%f\t%p\t1\n" | sort -f >> "$1"
fi
