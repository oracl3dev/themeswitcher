#!/bin/bash
# ~/.config/theme/scripts/apply-theme.sh

STATE_FILE="$HOME/.config/theme/.current_theme"

THEME_NAME="$1"
WALL="$2"

[ -z "$WALL" ] && exit 1

pgrep swww-daemon >/dev/null || swww-daemon &

swww img "$WALL" --transition-type wipe --transition-duration 3

wal -i "$WALL" --backend kitty -q

kitty @ set-colors --all ~/.cache/wal/colors-kitty.conf

hyprctl reload

echo "$THEME_NAME|$WALL" > "$STATE_FILE"