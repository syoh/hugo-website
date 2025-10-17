#!/bin/bash
set -e

echo "🚀 Setting up Hugo development environment..."

# Navigate to the workspace
cd /workspaces/hugo-website

# Verify Hugo installation
echo "✓ Hugo version:"
hugo version

# Create necessary directories if they don't exist
mkdir -p content
mkdir -p layouts
mkdir -p assets/css
mkdir -p static

# Install npm dependencies if package.json exists
if [ -f "package.json" ]; then
    echo "📦 Installing npm dependencies..."
    npm ci
else
    echo "ℹ️  No package.json found, skipping npm install"
fi

# Verify theme submodule
if [ -d "themes/PaperMod" ]; then
    echo "✓ PaperMod theme found"
else
    echo "⚠️  PaperMod theme not found. Initializing submodule..."
    git submodule update --init --recursive
fi

# Create a .gitignore entry for Hugo build artifacts
if ! grep -q "^public/$" .gitignore 2>/dev/null; then
    echo "" >> .gitignore
    echo "# Hugo build artifacts" >> .gitignore
    echo "public/" >> .gitignore
    echo "resources/_gen/" >> .gitignore
fi

echo "✅ Hugo development environment ready!"
echo ""
echo "📝 To start the development server, run:"
echo "   hugo server"
echo ""
echo "🌐 The site will be available at http://localhost:1313"
echo ""
