#!/usr/bin/env sh

set -eux

docker run "${IMAGE_ID:-youtube-dl}" \
  -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' \
  -o '%(uploader)s/%(upload_date)s - %(title)s.%(id)s.%(ext)s' \
  --write-info-json \
  --add-metadata \
  --all-subs \
  --embed-subs \
  --embed-thumbnail \
  https://www.youtube.com/watch?v=g91WrNwUlRY
