#!/bin/bash
# ~/.config/theme/scripts/theme-picker.sh

THEME_FILE="$HOME/.config/themes/themes.conf"

[ ! -f "$THEME_FILE" ] && echo "No themes.conf found!" && exit 1

CHOICE=$(cut -d'|' -f1 "$THEME_FILE" | wofi --dmenu --prompt "Select theme:")
[ -z "$CHOICE" ] && exit 0

WALL=$(grep "^$CHOICE|" "$THEME_FILE" | cut -d'|' -f2)
[ -z "$WALL" ] && exit 1

~/.config/theme/scripts/apply-theme.sh "$CHOICE" "$WALL"