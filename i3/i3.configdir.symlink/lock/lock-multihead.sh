#!/bin/bash

# parameters

# masks dir : contains masks composed of 10x10 white circles on black background
masks_dir=~/dotfiles/i3/lock/masks
icons_dir=~/dotfiles/i3/lock/icons

# files
screenshot=/tmp/screenaaa.png
thumbnail=/tmp/screenaaa-thumb.png
screenshot_masked=/tmp/screen-masked.png

# prepare
mkdir -p "$masks_dir"
scrot "$screenshot" -t 10
screensize=$(file "$screenshot" | grep -o '[0-9]* x [0-9]*' | tr -d ' ')
mask=$masks_dir/mask_$screensize.png

icon="$icons_dir"/lock.png

if [[ "$#" -eq 1 ]]; then
	icon="$icons_dir"/"$1";
fi

# create mask if not exists
if [ ! -f "$mask" ]; then
    echo "Creating mask image "$mask
    convert -size 10x10 xc: -draw 'circle 5,5 1,3' -negate -write mpr:spot +delete -size $screensize xc:white tile:mpr:spot +swap -compose multiply -composite "$mask"
else
    echo "Reusing existing mask image "$mask
fi

# scale up thumbnail and apply mask
time convert "$thumbnail" -scale 1000% "$mask" -compose multiply -composite "$screenshot_masked"

# add icon if defined and exists
if [[ -f "$icon" ]]; then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file "$icon" | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)

	SR=$(xrandr | awk '/\ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $3}')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        PY=$(($SROY + $SRY/2 - $RY/2))

        convert "$screenshot_masked" "$icon" -geometry +$PX+$PY -composite -matte "$screenshot_masked"
        echo "Added icon on $PX,$PY"
    done
fi
# dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
# i3lock  -I 10 -d -e -u -n -i /tmp/screen.png
i3lock --verifcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c  -i "$screenshot_masked" -t -n

# clean-up
rm $screenshot $thumbnail $screenshot_masked
