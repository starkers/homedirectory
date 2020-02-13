#!/bin/bash

images=()
swaylock_args=()

for output in $(swaymsg -t get_outputs | jq -r '.[] .name'); do
  image=$(mktemp --suffix=.png)
  images+=($image)
  swaylock_args+=(-i $output:$image)
  grim -o $output $image
done

convert ${images[@]} -blur 8x8 ${images[@]}

swaylock ${swaylock_args[@]} -s fill
rm ${images[@]}
