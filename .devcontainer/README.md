# Development Container Setup

This repository includes a development container configuration for local Hugo website development.

## What's Included

- **Hugo Extended v0.147.2** - Latest version with SCSS/SASS support
- **Node.js & npm** - For asset processing and tooling
- **Git** - Version control
- **GitHub CLI** - GitHub integration
- **VS Code Extensions** - Pre-configured for Hugo development
  - Hugo Theme and Syntax Highlighting
  - Markdown editing and linting
  - Git integration
  - Spell checker
  - Code formatting

## Getting Started

### Prerequisites

- **Docker** - Required to run the development container
- **VS Code** with **Dev Containers extension** (ms-vscode-remote.remote-containers)
  - Or use **GitHub Codespaces** for cloud-based development

### Local Development with Dev Containers

1. **Open the workspace in a dev container:**
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Select "Dev Containers: Reopen in Container"
   - Wait for the container to build and start

2. **The environment will automatically:**
   - Install Hugo Extended v0.147.2
   - Install all development dependencies
   - Initialize Git submodules
   - Configure VS Code with Hugo extensions

3. **Start the development server:**
   ```bash
   hugo server
   ```
   Or use the Makefile:
   ```bash
   make serve
   ```

   The site will be available at `http://localhost:1313`

### Using GitHub Codespaces

1. Click the green **<> Code** button on the repository
2. Select **Codespaces** tab
3. Click **Create codespace on main**
4. VS Code will open in your browser with the dev container ready
5. Run `hugo server` to start developing

## Makefile Commands

Common development tasks:

```bash
make serve       # Start development server with drafts and future posts
make build       # Build the static site
make clean       # Clean build artifacts
make validate    # Validate site configuration
make draft       # List all draft posts
make publish     # List all published posts
make new-post NAME=slug    # Create a new post
make new-page NAME=slug    # Create a new page
```

## Project Structure

```
hugo-website/
├── .devcontainer/          # Development container configuration
│   ├── devcontainer.json   # Main dev container config
│   ├── Dockerfile          # Custom container image
│   └── postCreate.sh       # Setup script
├── archetypes/             # Content templates
├── assets/                 # CSS and other assets
├── content/                # Your site content
│   ├── books/
│   ├── courses/
│   ├── papers/
│   ├── data/
│   └── tags/
├── layouts/                # Custom HTML templates
├── static/                 # Static files (images, docs, etc.)
├── themes/                 # Theme (PaperMod)
├── config.yml              # Site configuration
└── Makefile                # Development tasks
```

## Editing Content

### Creating New Posts

```bash
# Using Hugo
hugo new content/papers/my-paper/index.md

# Or using Makefile
make new-post NAME=my-post
```

### Content Structure

Posts typically follow this structure:
```markdown
---
title: "My Post Title"
date: 2025-10-17
draft: false
tags: ["tag1", "tag2"]
---

Your content here...
```

## Building and Deployment

### Local Build

```bash
make build
# Static files will be generated in the public/ directory
```

### Deployment

The site is deployed to GitHub Pages via GitHub Actions when you push to the main branch.

The workflow is defined in `.github/workflows/hugo.yml` and:
1. Builds the site with Hugo
2. Deploys the `public/` directory to GitHub Pages

## Troubleshooting

### Port Already in Use

If port 1313 is already in use:
```bash
hugo server --port 1314
```

### Theme Issues

If the PaperMod theme is missing:
```bash
git submodule update --init --recursive
```

### Clearing Cache

To completely rebuild the site:
```bash
make clean
make build
```

### Container Build Issues

If the container fails to build:
1. Rebuild the container: Press `Ctrl+Shift+P` → "Dev Containers: Rebuild Container"
2. Or remove and restart: "Dev Containers: Reopen in Container"

## Performance Tips

1. **Use `hugo server` in development** - It has fast incremental builds
2. **Use `make serve`** - Includes drafts and future posts for easier testing
3. **Check your theme** - Complex custom templates can slow builds
4. **Minimize content** - Use lightweight images and avoid heavy assets

## Additional Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [PaperMod Theme](https://github.com/adityatelange/hugo-PaperMod)
- [Hugo Templating](https://gohugo.io/templates/introduction/)
- [YAML Frontmatter](https://gohugo.io/content-management/front-matter/)

## Getting Help

If you encounter issues:

1. Check the Hugo logs in the terminal
2. Verify `config.yml` for syntax errors
3. Ensure all theme files are present
4. See the main README.md for general setup information
