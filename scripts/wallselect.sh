#!/usr/bin/env bash

# --- Configuration ---
WALLPAPER_DIR="$HOME/Pictures/aesthic-wallpapers/landscapes"   # <-- set your folder

# --- Rofi call ---
selected=$(for a in $WALLPAPER_DIR/*; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -no-layers -config ~/.config/rofi/selector.rasi)

# --- Apply if valid ---
[ -n "$selected" ] && wal -i "$selected"