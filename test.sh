#!/usr/bin/env sh

set -eux

docker run "${IMAGE_ID:-youtube-dl}" \
  -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' \
  --add-metadata \
  --all-subs \
  --embed-subs \
  --embed-thumbnail \
  https://www.youtube.com/watch?v=g91WrNwUlRY
