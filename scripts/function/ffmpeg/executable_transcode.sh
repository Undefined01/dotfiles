#!/bin/bash

in="$HOME/videos/in"
out="$HOME/videos/out"
log="$HOME/videos/log"
mkdir -p "$in" "$out" "$log"

ffmpeg="/opt/ffmpeg/bin/ffmpeg"

function t()
{
    filename="${1%.*}"
    if [[ -f "$out/$filename.mkv" ]]; then
        echo "$1" is already been transcoded. Ignored.
        return
    fi
    echo transcode "$1" to "$filename.mkv"
    "$ffmpeg" \
        -i "$in/$1" \
        -c:v libsvtav1 -preset 5 -crf 45 -r 30 -g 300 -svtav1-params tune=0:film-grain=8 \
        -c:a libopus -b:a 96k \
        "$out/$filename.mkv" >"$log/$filename.log" 2>&1
    ls -lh "$out/$filename.mkv"
}

for arg in "$@"
do
    t "$arg"
done

