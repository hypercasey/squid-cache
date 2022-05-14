#!/usr/bin/bash

if [[ $(pgrep squid) ]]; then
    echo "Squid is running with PID $(pgrep squid)"
else
    echo "Squid is not running."
    exit 1
fi