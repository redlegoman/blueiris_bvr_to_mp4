#!/bin/bash
DIR="."
find "$DIR" -name "*.bvr"|while read FULL
do
  echo "FULL = $FULL"
  FILENAME=$(basename "$FULL")
  echo "FILENAME = $FILENAME"
  DIRNAME=$(dirname "$FULL")
  echo "DIRNAME = $DIRNAME"
  OUTFILE=$(echo "$FILENAME"|sed -e s/.bvr/.mp4/g )
  echo "OUTFILE = $OUTFILE"
  OUTDIR="${DIRNAME}"
  echo "OUTDIR = $OUTDIR"
  ffmpeg -loglevel error -i "${FULL}" -vcodec libx264 -crf 30 "${OUTDIR}/${OUTFILE}" -y </dev/null
echo "-------------------------------"
done
