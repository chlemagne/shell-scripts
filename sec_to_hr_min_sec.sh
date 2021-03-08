#!/bin/bash

# sec_to_hr_min_sec.sh - convert seconds to hour, minutes, and seconds

# constants
INPUT_TO=10
RE_NUMBER="^[0-9]+$"

# read input
seconds=$1
if [ -z "$seconds" ]; then
	if ! read -t $INPUT_TO -p "Enter duration in seconds: " seconds; then
		echo
		echo "ERROR: Input timeout ($INPUT_TO s)" >&2
		exit 1
	fi
fi

# validate input
if ! [[ $seconds =~ $RE_NUMBER  ]]; then
	echo "ERROR: Input not a number" >&2
	exit 1
fi

# convert
hours=$((seconds / 3600))
seconds=$((seconds % 3600))
minutes=$((seconds / 60))
seconds=$((seconds % 60))

echo "$hours hour(s), $minutes minute(s), $seconds second(s)"

