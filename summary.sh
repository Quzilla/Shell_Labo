#!/bin/zsh

for file in "$@"
do
    echo ""
    if [ -d "$file" ]; then
        echo "$file is a directory;"
        ls $file
    elif [ -f "$file" ]; then
        echo "$file is regular file"
        head -n 5 "$file"
    fi
done

