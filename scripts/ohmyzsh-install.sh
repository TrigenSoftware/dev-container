#!/bin/sh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install PNPM Shell Completion
INSTALL_TEMP=$(mktemp -d)
VERSION="v0.5.5"
ARCH=$(uname -m)

cd "$INSTALL_TEMP"

if [ "$ARCH" = "x86_64" ]; then
  curl -L "https://github.com/g-plane/pnpm-shell-completion/releases/download/${VERSION}/pnpm-shell-completion_x86_64-unknown-linux-musl.tar.gz" | tar -xz
elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
  curl -L "https://github.com/g-plane/pnpm-shell-completion/releases/download/${VERSION}/pnpm-shell-completion_aarch64-unknown-linux-gnu.tar.gz" | tar -xz
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

./install.zsh ~/.oh-my-zsh/custom/plugins

cd ~/
rm -rf "$INSTALL_TEMP"

# Update .zshrc to include additional plugins
sed -i 's/plugins=(git)/plugins=(git last-working-dir node asdf zsh-syntax-highlighting pnpm-shell-completion)/' ~/.zshrc
