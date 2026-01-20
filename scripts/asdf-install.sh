#!/bin/sh

VERSION="v0.18.0"
ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
  curl -L "https://github.com/asdf-vm/asdf/releases/download/${VERSION}/asdf-${VERSION}-linux-amd64.tar.gz" | tar -xz -C /usr/local/bin asdf
elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
  curl -L https://github.com/asdf-vm/asdf/releases/download/${VERSION}/asdf-${VERSION}-linux-arm64.tar.gz | tar -xz -C /usr/local/bin asdf
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

echo 'source /scripts/asdf-prep.sh' >> ~/.zshrc
