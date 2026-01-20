# Dev Container

## trigen/dev-container:latest

Main image for development based on Ubuntu 25.04 with preinstalled Oh my Zsh and Asdf, and configured PNPM cache.

```bash
docker run -it \
  -v $(pwd):/workspace \
  -v $(pwd)/.cache:/cache \
  -v $(pwd)/ssh:/root/.ssh \
  trigen/dev-container:latest
```

Mount points:

| Path | Description |
|------|-------------|
| `/workspace` | Your project(s) directory |
| `/cache` | Cache for asdf, pnpm, zsh history, git config |

## trigen/dev-container:tunnel

Image to run VS Code Remote Tunnels.

```bash
docker run -it \
  --hostname dev-container \
  -v $(pwd):/workspace \
  -v $(pwd)/.cache:/cache \
  -v $(pwd)/ssh:/root/.ssh \
  trigen/dev-container:tunnel
```

> [!NOTE]  
> `--hostname` should be the same each run for VS Code Tunnel session reuse

Mount points:

| Path | Description |
|------|-------------|
| `/workspace` | Your project(s) directory |
| `/cache` | Cache for asdf, pnpm, zsh history, git config |

Environment variables:

| Name | Description | Default |
|------|-------------|---------|
| TUNNEL_NAME | Name of the tunnel | dev-container |
| TUNNEL_PROVIDER | Authentication provider (github or microsoft) | github |
