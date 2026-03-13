#!/bin/bash
# ~/.config/theme/scripts/restore-theme.sh

STATE_FILE="$HOME/.config/theme/.current_theme"
[ ! -f "$STATE_FILE" ] && exit 0

IFS="|" read -r THEME WALL < "$STATE_FILE"

swww img "$WALL" --transition-type none

sleep 0.5

~/.config/theme/scripts/apply-theme.sh "$THEME" "$WALL"