#!/bin/sh

wf-recorder -g "$(slurp)" -F fps=30 -c gif -f /tmp/recording.gif
