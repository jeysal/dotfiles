#!/usr/bin/env bash
set -e

TEMPLATE=~/.config/waybar/config.template.jsonc
OUTPUT=~/.config/waybar/config.jsonc

cores=$(nproc)

format_icons=""
for ((i=0; i<cores; i++)); do
  format_icons+="\{icon$i\}"
done

sed "s|__CPU_FORMAT__|$format_icons|" "$TEMPLATE" > "$OUTPUT"
