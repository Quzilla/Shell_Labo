#!/bin/zsh

echo echo "Let's write a description in the past command, Please write"
read "cmd?command: "
echo "--- $cmd ---"
read "description?description: "
echo "$cmd,$description" >> mydict.csv
echo "writing complete!!"