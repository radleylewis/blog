#!/usr/bin/env bash

ffmpeg -ss 0 -t 15 -i 1.mp4 \
	-vf "fps=10,scale=1080:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
	-loop 0 output.gif
