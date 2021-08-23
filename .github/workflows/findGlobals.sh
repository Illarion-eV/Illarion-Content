#!/bin/bash

# Analysis script for Illarion Lua Scripts
# Locates usage of global variables
# Takes filename as parameter
# Author: Martin Karing <nitram@illarion.org>
# Author: Andreas Grob <vilarion@illarion.org>

allowedGlobals="bit32 assert collectgarbage dofile error _G getfnev getmetatable ipairs load loadfile loadstring next pairs pcall print rawequal rawget rawset select setfenv setmetatable tonumber tostring type unpack _VERSION xpcall coroutine module require package string table math io file os debug world Player position Character MessageDialog SelectionDialog CraftingDialog InputDialog MerchantDialog LongTimeEffect isValidChar ScriptVars Random Action ItemLookAt WeaponStruct ArmorStruct getCharForId log debug colour Item scriptItem"

isAllowedGlobalVar() {
    [[ $allowedGlobals =~ (^|[[:space:]])$1($|[[:space:]]) ]] && return 0 || return 1
}
for file in $(find . -type d \( -path ./.git -o -path ./.github \) -prune -false -o -type f -name '*.lua');
do
    rm -f parsed.log setGlobals.log getGlobals.log
    luac -p -l $file 2>/dev/null > parsed.log
    cat parsed.log | grep "SETTABUP.*_ENV" > setGlobals.log
    sed -i -r 's/^\s+[0-9]+\s+\[([0-9]+)\]\s+SETTABUP\s+[0-9-]+\s+[0-9-]+\s+[0-9-]+\s+;\s+_ENV\s+"(\w*)".*$/\1,\2/g' setGlobals.log
    sed -i -r 's/^\s+[0-9]+\s+\[([0-9]+)\]\s+SETTABUP\s+[0-9-]+\s+[0-9-]+\s+[0-9-]+\s+;\s+_ENV.*$/\1,unknown/g' setGlobals.log

    cat parsed.log | grep "GETTABUP.*_ENV.*\"" > getGlobals.log
    sed -i -r 's/^\s+[0-9]+\s+\[([0-9]+)\]\s+GETTABUP\s+[0-9-]+\s+[0-9-]+\s+[0-9-]+\s+;\s+_ENV\s+"(\w*)".*$/\1,\2/g' getGlobals.log

    while read line; do
        echo $line | sed -r 's/^([0-9]+),(\w+)$/:\1: Defined global variable "\2"/g' | sed s/'global variable "unknown"/unknown global variable/g' | (echo -n $file && cat) >> temp.log
    done <setGlobals.log

    while IFS=',' read -ra globalVar; do
        isAllowedGlobalVar "${globalVar[1]}"
        if [ $? -eq 1 ]
        then
            cat setGlobals.log | grep -q ",${globalVar[1]}$"
            if [ $? -eq 1 ]
            then
                echo "$file:${globalVar[0]}: Found access to unexpected global variable \"${globalVar[1]}\"" >> temp.log
            fi
        fi 
    done <getGlobals.log
done

if [ -s "temp.log" ]
then
    cat temp.log
fi
rm -f temp.log parsed.log setGlobals.log getGlobals.log
