#!/bin/sh
set -e

SETTINGS_JSON="/cache/vscode/server/data/Machine/settings.json"

if [ ! -f "$SETTINGS_JSON" ]; then
  mkdir -p "$(dirname "$SETTINGS_JSON")"
  cat > "$SETTINGS_JSON" <<EOF
{
  "git.decorations.enabled": true,
  "explorer.decorations.colors": true,
  "explorer.decorations.badges": true
}
EOF
fi

if [ ! -f "/cache/vscode/cli/token.json" ]; then
  code tunnel user login \
    --provider "$TUNNEL_PROVIDER" \
    --cli-data-dir /cache/vscode/cli
fi

exec code tunnel \
  --accept-server-license-terms \
  --name "$TUNNEL_NAME" \
  --cli-data-dir /cache/vscode/cli \
  --server-data-dir /cache/vscode/server \
  --extensions-dir /cache/vscode/extensions
