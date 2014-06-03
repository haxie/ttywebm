#!/bin/bash

pngs=$(find . -maxdepth 1 -name '*.png')

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Usage: $package [-a file.mp3] [-fps 12]  -o output.webm"
            exit 0
            ;;
        -a)
            shift
            if test $# -gt 0; then
                # export AUDIO=$1
                export AUDIOARGS="-i $1 -map 0:v -map 1:a"
            else
                echo "No audio file specified"
                exit 1
            fi
            shift
            ;;
        -o)
            shift
            if test $# -gt 0; then
                export OUTPUT=$1
            else
                echo "No output file specified"
                exit 1
            fi
            shift
            ;;
        -fps)
            shift
            if test $# -gt 0; then
                export FRAMERATE=$1
            else
                echo "No framerate specified"
                exit 1
            fi
            shift
            ;;
        *)
            break
            ;;
    esac
done

if [ -z $FRAMERATE ]; then
    export FRAMERATE="12"
fi

echo "Creating WebM"
_ffmpeg="ffmpeg -framerate $FRAMERATE -i %*.png $AUDIOARGS -s:v 1280x720 -c:v libvpx -b:v 1M -crf 23 -c:a libvorbis -r 30 -shortest $OUTPUT -y"

eval "$_ffmpeg" &> /dev/null

echo "Deleting Temporary PNGs"
rm $pngs
