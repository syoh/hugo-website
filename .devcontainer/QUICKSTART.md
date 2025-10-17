# Hugo Website Development Container - Quick Start Guide

## ✨ Features Included

✅ **Hugo Extended v0.147.2** - Full SCSS/SASS support
✅ **Node.js & npm** - Asset processing and tooling
✅ **Git & GitHub CLI** - Version control integration
✅ **VS Code Extensions** - Hugo syntax highlighting, Markdown tools, Git integration
✅ **Makefile** - Common development commands
✅ **Auto-forwarded Port** - Port 1313 automatically available

## 🚀 Getting Started

### Option 1: Local Dev Container (VS Code)

1. Install **VS Code** and the **Dev Containers** extension
2. Open this repository in VS Code
3. Press `Ctrl+Shift+P` (or `Cmd+Shift+P`)
4. Select **"Dev Containers: Reopen in Container"**
5. Wait for the container to build and start
6. Run: `hugo server` or `make serve`

### Option 2: GitHub Codespaces

1. Click **<> Code** → **Codespaces** → **Create codespace on main**
2. Wait for the environment to load
3. Run: `hugo server` or `make serve`
4. Click the notification to open in browser

## 📋 Available Commands

```bash
make serve       # Start dev server (http://localhost:1313)
make build       # Build static site
make clean       # Clean build artifacts
make validate    # Check site config
make draft       # List draft posts
make publish     # List published posts
make new-post NAME=slug    # Create new post
make new-page NAME=slug    # Create new page
```

## 📁 Configuration Files

- **`.devcontainer/devcontainer.json`** - Main dev container configuration
- **`.devcontainer/Dockerfile`** - Custom container image with Hugo Extended
- **`.devcontainer/postCreate.sh`** - Automatic setup script
- **`.devcontainer/.env`** - Development environment variables
- **`.devcontainer/README.md`** - Detailed development guide
- **`Makefile`** - Development task automation

## 🔧 Customization

### Adding More Extensions

Edit `.devcontainer/devcontainer.json` and add to the `extensions` array:

```json
"extensions": [
  "existing.extension",
  "publisher.new-extension"  // Add here
]
```

### Changing Hugo Version

Edit `.devcontainer/Dockerfile` and update:

```dockerfile
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.X.X/hugo_extended_0.X.X_linux-amd64.tar.gz
```

### Modifying Dev Server Port

In `devcontainer.json`, change the `forwardPorts`:

```json
"forwardPorts": [1314],  // Or any other port
```

## 📖 Documentation

- Full setup guide: `.devcontainer/README.md`
- Hugo docs: https://gohugo.io/documentation/
- PaperMod theme: https://github.com/adityatelange/hugo-PaperMod

## 🆘 Troubleshooting

**Port in use?** Run `hugo server --port 1314`

**Theme missing?** Run `git submodule update --init --recursive`

**Container won't build?** Press `Ctrl+Shift+P` → "Dev Containers: Rebuild Container"

**Need fresh start?** Run `make clean` then `make build`

## 📝 Development Workflow

1. **Start server:** `make serve`
2. **Create content:** `make new-post NAME=my-post`
3. **Edit files** in `content/`, `layouts/`, `assets/`
4. **Live reload** - Changes appear automatically in browser
5. **Build for production:** `make build`

Happy writing! 🎉
