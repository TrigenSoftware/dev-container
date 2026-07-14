# Dev Container

## trigen/dev-container:latest

Main image for development based on Ubuntu 25.04 with preinstalled Oh my Zsh and Asdf, and configured PNPM cache.

```bash
docker run -it \
  -v $(pwd):/workspace \
  -v $(pwd)/home:/root \
  -v $(pwd)/.cache:/cache \
  trigen/dev-container:latest
```

Mount points:

| Path | Description |
|------|-------------|
| `/workspace` | Your project(s) directory |
| `/root` | Home directory — shell/tool configs, ssh keys, tokens (persisted as a whole) |
| `/cache` | Cache for asdf, pnpm, zsh history, git config |

> [!NOTE]
> The whole home directory is persisted, so any tool that writes to `$HOME` keeps its data across restarts without adding a new mount. Configs baked into the image (Oh My Zsh, `.zshrc`) are seeded into an empty `home/` on first start and never overwrite your own files afterwards. Since this directory holds ssh keys and auth tokens, keep it out of synced/backed-up/committed locations.

## trigen/dev-container:tunnel

Image to run VS Code Remote Tunnels.

```bash
docker run -it \
  --hostname dev-container \
  -v $(pwd):/workspace \
  -v $(pwd)/home:/root \
  -v $(pwd)/.cache:/cache \
  trigen/dev-container:tunnel
```

> [!NOTE]  
> `--hostname` should be the same each run for VS Code Tunnel session reuse

Mount points:

| Path | Description |
|------|-------------|
| `/workspace` | Your project(s) directory |
| `/root` | Home directory — shell/tool configs, ssh keys, tokens (persisted as a whole) |
| `/cache` | Cache for asdf, pnpm, zsh history, git config |

Environment variables:

| Name | Description | Default |
|------|-------------|---------|
| TUNNEL_NAME | Name of the tunnel | dev-container |
| TUNNEL_PROVIDER | Authentication provider (github or microsoft) | github |
