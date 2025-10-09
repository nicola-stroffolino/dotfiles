#!/usr/bin/env bash

# --- Configuration ---
WALLPAPER_DIR="$HOME/Pictures/aesthic-wallpapers/landscapes"   # <-- your folderù
CACHE_DIR="$HOME/.cache/rofi-wallpapers"
mkdir -p "$CACHE_DIR"

# --- Build list with square previews ---
entries=""
for img in "$WALLPAPER_DIR"/*.{jpg,png,jpeg,gif}; do
    [ -e "$img" ] || continue
    base=$(basename "$img")
    thumb="$CACHE_DIR/$base"

    # create thumbnail only if missing or older than source
    if [ ! -f "$thumb" ] || [ "$img" -nt "$thumb" ]; then
        magick "$img" -resize 500x500^ -gravity center -extent 500x500 "$thumb"
    fi

    entries+="$base\x00icon\x1f$thumb\n"
done

# --- Rofi selection ---
selected=$(echo -en "$entries" | rofi -dmenu -p "Search" -config ~/.config/rofi/selector.rasi)

# --- Apply if valid ---
if [ -n "$selected" ]; then
    wal -i "$WALLPAPER_DIR/$selected"
fi