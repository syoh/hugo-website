# Hugo Website Development Container - Complete Setup

## 📦 What Was Created

Your Hugo website development environment is now fully configured! Here's what was set up:

### Development Container Files (`.devcontainer/`)

| File | Purpose |
|------|---------|
| **devcontainer.json** | Main dev container configuration for VS Code and GitHub Codespaces |
| **Dockerfile** | Custom Ubuntu 24.04 image with Hugo Extended v0.147.2, Node.js, and development tools |
| **postCreate.sh** | Automatic setup script that runs when the container starts |
| **.env** | Environment variables for development (Hugo settings, Node environment, etc.) |
| **README.md** | Comprehensive development guide with commands and troubleshooting |
| **QUICKSTART.md** | Quick reference guide for getting started |

### VS Code Configuration (`.vscode/`)

| File | Purpose |
|------|---------|
| **devcontainer.json** | (referenced from dev container) |
| **tasks.json** | Pre-configured tasks for Hugo operations (serve, build, clean, validate) |
| **settings.json** | Editor settings optimized for Hugo development |
| **extensions.json** | Recommended VS Code extensions for Hugo development |

### Project Root

| File | Purpose |
|------|---------|
| **Makefile** | Development task automation with common commands |

## 🚀 Quick Start

### Using VS Code Dev Containers (Recommended)

```bash
# 1. Open in VS Code (if not already)
# 2. Press Ctrl+Shift+P (or Cmd+Shift+P on Mac)
# 3. Select "Dev Containers: Reopen in Container"
# 4. Wait for setup to complete
# 5. In terminal, run:
hugo server
# OR
make serve
```

### Using GitHub Codespaces

```bash
# 1. Click <> Code → Codespaces → Create codespace on main
# 2. Wait for environment to load
# 3. Run:
hugo server
```

## 📋 Available Commands

### Using Makefile

```bash
make help       # Show all available commands
make serve      # Start development server (includes drafts)
make build      # Build production site
make clean      # Clean build artifacts
make validate   # Check site configuration
make draft      # List all draft posts
make publish    # List published posts
make new-post NAME=my-post      # Create new post
make new-page NAME=my-page      # Create new page
```

### Using VS Code Tasks

Press `Ctrl+Shift+P` and search for "Tasks: Run Task" then select:
- **Hugo: Start Server** - Start development server
- **Hugo: Build Site** - Build static site
- **Hugo: Clean Build** - Clean build artifacts
- **Hugo: Validate Configuration** - Check config

### Using Hugo Directly

```bash
hugo server --buildDrafts --buildFuture    # Start server (includes drafts)
hugo --minify                               # Build production site
hugo new posts/my-post.md                   # Create new post
```

## 📁 Project Structure

```
hugo-website/
├── .devcontainer/              # ← Development container config
│   ├── devcontainer.json       # Main configuration
│   ├── Dockerfile              # Container image definition
│   ├── postCreate.sh           # Setup script
│   ├── .env                    # Environment variables
│   ├── README.md               # Full development guide
│   └── QUICKSTART.md           # Quick reference
├── .vscode/                    # ← VS Code configuration
│   ├── tasks.json              # Task definitions
│   ├── settings.json           # Editor settings
│   └── extensions.json         # Recommended extensions
├── Makefile                    # ← Development tasks
├── archetypes/                 # Content templates
├── assets/                     # CSS and other assets
├── content/                    # Your site content
├── layouts/                    # Custom HTML templates
├── static/                     # Static files
├── themes/                     # Theme (PaperMod)
└── config.yml                  # Site configuration
```

## 🔧 What's Included

### Base Environment
- **Ubuntu 24.04 LTS** - Latest Ubuntu LTS
- **Hugo Extended v0.147.2** - SCSS/SASS support included
- **Node.js & npm** - For asset processing
- **Git & GitHub CLI** - Version control

### VS Code Extensions (Auto-installed)
- `golang.go` - Go language support
- `budparr.language-hugo-vscode` - Hugo syntax highlighting
- `DerrickBeal.hugo-themekaustik` - Hugo theme support
- `yzhang.markdown-all-in-one` - Markdown editing
- `davidanson.vscode-markdownlint` - Markdown linting
- `eamodio.gitlens` - Git integration
- `mhutchie.git-graph` - Git visualization
- `streetsidesoftware.code-spell-checker` - Spell checking
- And more...

### Editor Configuration
- ✅ Smart indentation (2-space YAML, 2-space markdown)
- ✅ Auto-formatting on save (optional)
- ✅ Trailing whitespace removal
- ✅ Final newline insertion
- ✅ Spell checking with custom dictionary
- ✅ Line length guides (80 and 120 characters)

## 🎯 Development Workflow

1. **Start your dev container:**
   - Open repo in VS Code
   - Press `Ctrl+Shift+P`
   - Select "Dev Containers: Reopen in Container"

2. **Start the server:**
   ```bash
   make serve
   ```

3. **Create content:**
   ```bash
   make new-post NAME=my-interesting-post
   ```

4. **Edit files:**
   - Edit markdown in `content/`
   - Modify templates in `layouts/`
   - Update styles in `assets/css/`

5. **Live preview:**
   - Browser automatically reloads changes
   - Port 1313 is automatically forwarded

6. **Build for production:**
   ```bash
   make build
   ```

## 🌐 Port Forwarding

The dev container automatically forwards:
- **Port 1313** - Hugo development server
  - URL: `http://localhost:1313`
  - Accessible from your host machine

## 🧹 Cleanup Commands

```bash
# Remove build artifacts
make clean

# Start fresh
rm -rf public resources/_gen
make serve

# Reset everything
make clean
git clean -fd
```

## 📚 Documentation

- **Full guide:** `.devcontainer/README.md`
- **Quick start:** `.devcontainer/QUICKSTART.md`
- **Hugo docs:** https://gohugo.io/documentation/
- **PaperMod theme:** https://github.com/adityatelange/hugo-PaperMod

## 🆘 Troubleshooting

### Port 1313 already in use?
```bash
hugo server --port 1314
```

### Theme files missing?
```bash
git submodule update --init --recursive
```

### Container won't build?
- Press `Ctrl+Shift+P`
- Select "Dev Containers: Rebuild Container"

### Strange build errors?
```bash
make clean
hugo server
```

### Want to check Hugo version?
```bash
hugo version
```

## ✨ Next Steps

1. ✅ Open in dev container
2. ✅ Run `make serve`
3. ✅ Visit http://localhost:1313
4. ✅ Start editing content!

## 📝 Tips

- **Draft posts:** Use `draft: true` in frontmatter to hide posts
- **Future posts:** Use dates in future to schedule posts
- **Live reload:** Changes save automatically in `hugo server`
- **Git integration:** Use `Ctrl+` to open Git commands
- **Extensions:** Press `Ctrl+Shift+X` to manage VS Code extensions

---

**Happy Hugo development!** 🎉

For questions or issues, see the development guides in `.devcontainer/README.md`
