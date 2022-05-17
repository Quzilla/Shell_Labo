#!/bin/zsh

checkparam ()
{
    if [ -z "$1" ]; then
        return 1
    fi

    ls "$1"
}
checkparam
echo $?