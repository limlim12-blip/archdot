#!/bin/bash

# Check if cava is installed
if ! command -v cava &> /dev/null; then
    echo "cava not found"
    exit 1
fi

# Visual characters: 
# We use a space for 0 to keep the bar width constant
bar=" ▂▃▄▅▆▇█"
dict="s/;//g;"

# Create a dictionary to replace numbers with bars using sed
i=0
while [ $i -lt ${#bar} ]
do
    dict="${dict}s/$i/${bar:$i:1}/g;"
    i=$((i=i+1))
done

# Create a temporary config file for cava
config_file=$(mktemp)
cat > "$config_file" <<EOF
[general]
bars = 10
framerate = 60

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

# Cleanup on exit
trap "rm -f $config_file" EXIT

# Run cava -> pipe to sed (unbuffered) to replace numbers with bars
cava -p "$config_file" | sed -u "$dict"
