#!/bin/sh

export ASDF_DATA_DIR="$CACHE_DIR/asdf"
export PNPM_HOME="$CACHE_DIR/pnpm"
export PATH="$ASDF_DATA_DIR/shims:$PNPM_HOME:$PATH"

if [ ! -d "$ASDF_DATA_DIR" ]; then
  mkdir -p "$ASDF_DATA_DIR"
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf plugin add pnpm https://github.com/jonathanmorley/asdf-pnpm.git
fi

if [ ! -f "$HOME/.config/pnpm/rc" ]; then
  mkdir -p "$HOME/.config/pnpm"
  echo "store-dir=$PNPM_STORE_PATH" > "$HOME/.config/pnpm/rc"
fi
