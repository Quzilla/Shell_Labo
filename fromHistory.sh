#!/bin/zsh

if [ "$1" != "$HOME/.zsh_history" ]; then
    echo 'fromHistory.sh {$HISTFILE} ???'
    exit 1
fi

hist="$1"
awk '$1 != "exit" {print $0}' "$hist" | tail -n 8 | read -d  '' list

IFS=$'\n'
array=(`echo $list`)

echo ""
echo "Let's write a description in the past command, Please select"
echo '=== Command History ==='
select cmd in $array exit
do
    if [ "$cmd" = "exit" ]; then
        echo "ok, bye...!"
	    break
    else
        echo "--- $cmd ---"
        read "description?description: "
        echo "$cmd,$description" >> mydict.csv
        echo "writing complete!! next???"
    fi
done
