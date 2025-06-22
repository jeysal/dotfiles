#!/usr/bin/env zsh

# TODO
autorandr -c
# autorandr also executes this after profile load, but it might not find a profile on portable systems
~/.display.sh
~/.input.sh
