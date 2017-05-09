#! /bin/bash
song="$(cmus-remote -Q | grep tag | head -n 3 | sort -r | cut -d ' ' -f 3- | sed '3d' | sed '1!G;h;$!d' | sed 'N;s/\n/ - /')"

song_details="$(cmus-remote -Q | grep tag)"

if ! $song_details; then
    artist="$(cmus-remote -Q | grep 'tag artist' | cut -d ' ' -f3-)"
    title="$(cmus-remote -Q | grep 'tag title' | cut -d ' ' -f3-)"
    echo "  $artist - $title"
fi
