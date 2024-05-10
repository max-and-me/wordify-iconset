#!/usr/bin/env bash

# Absolute path this script is in, thus /home/user/bin
script_path=$(dirname "$SCRIPT")

inkscape="/Applications/Inkscape.app/Contents/MacOS/inkscape"
export_dir="$script_path/export"
mkdir "$export_dir"

search_dir=$script_path/svg
for entry in "$search_dir"/*
do
  echo "$entry"
  entry_name=${entry%.svg}
  entry_name=$(basename "${entry_name}")
  # echo "$entry_name"
  $inkscape --export-type="png" "$entry" --export-filename="${export_dir}/${entry_name}.png" --export-dpi="3"
  $inkscape --export-type="png" "$entry" --export-filename="${export_dir}/${entry_name}_2x.png" --export-dpi="6"
  $inkscape --export-type="png" "$entry" --export-filename="${export_dir}/${entry_name}_3x.png" --export-dpi="9"
  $inkscape --export-type="png" "$entry" --export-filename="${export_dir}/${entry_name}_4x.png" --export-dpi="12"
done