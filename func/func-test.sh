#!/bin/zsh

homesize ()
{
    date
    du -h ~ | tail -n 1
}
homesize