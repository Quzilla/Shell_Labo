#!/bin/zsh

if grep -q 'zsh' /etc/passwd; then
    echo "zsh found"
else
    echo "not found"
fi