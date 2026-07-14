#!/bin/sh
set -e

# Seed baked home configs (.zshrc, .oh-my-zsh, ...) into HOME. When HOME is a
# freshly mounted host volume it starts empty and would otherwise shadow the
# configs baked into the image. -n keeps any existing user/tool data intact, so
# this also fills in newly baked configs after an image rebuild without touching
# anything the user or a tool has already written.
mkdir -p "$HOME"
cp -an /opt/home-snapshot/. "$HOME/" 2>/dev/null || true

exec "$@"
