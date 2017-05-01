#!/bin/bash
PARENT=$(xwininfo -name "Guake!" -int -tree | sed -ne '/Root/s/[^0-9]//gp')
xdotool search --name "Guake!" windowreparent $PARENT
