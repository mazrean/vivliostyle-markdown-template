#!/bin/bash

markdown_file=$1
css_file=$2
output_file=$3

events=(-e CREATE -e MODIFY -e DELETE)
while inotifywait ${events[@]} $markdown_file $css_file; do
  npx vivliostyle build $markdown_file --no-sandbox --user-style $css_file -o $output_file
done
