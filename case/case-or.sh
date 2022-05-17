#!/bin/zsh

case "$1" in
    start | stop)
        echo "ok"
        ;;
    *)
        echo "ng"
        ;;
esac