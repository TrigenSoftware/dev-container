#!/bin/sh

export SHELL=/bin/zsh
export CACHE_DIR=/cache
export ASDF_DATA_DIR=$CACHE_DIR/asdf
export PNPM_HOME=$CACHE_DIR/pnpm/home
export PNPM_STORE_PATH=$CACHE_DIR/pnpm/store
export HISTFILE=$CACHE_DIR/zsh/.zsh_history
export GIT_CONFIG_GLOBAL=$CACHE_DIR/git/config

if [ ! -f "$HISTFILE" ]; then
  mkdir -p "$(dirname "$HISTFILE")"
  touch "$HISTFILE"
fi

if [ ! -f "$GIT_CONFIG_GLOBAL" ]; then
  mkdir -p "$(dirname "$GIT_CONFIG_GLOBAL")"
  touch "$GIT_CONFIG_GLOBAL"
fi
