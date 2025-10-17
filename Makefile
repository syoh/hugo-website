.PHONY: help serve build clean draft publish lint validate

help:
	@echo "Hugo Website Development Commands"
	@echo "=================================="
	@echo "  make serve       - Start Hugo development server (http://localhost:1313)"
	@echo "  make build       - Build the static site"
	@echo "  make clean       - Clean build artifacts"
	@echo "  make draft       - List all draft posts"
	@echo "  make publish     - List all published posts"
	@echo "  make validate    - Validate site configuration"
	@echo "  make new-post    - Create a new post (usage: make new-post NAME=my-post)"
	@echo "  make new-page    - Create a new page (usage: make new-page NAME=my-page)"

serve:
	@echo "🚀 Starting Hugo development server..."
	hugo server --buildDrafts --buildFuture

build:
	@echo "🏗️  Building static site..."
	hugo --minify

clean:
	@echo "🧹 Cleaning build artifacts..."
	rm -rf public/
	rm -rf resources/_gen/

draft:
	@echo "📝 Draft posts:"
	@find content -type f \( -name "*.md" -o -name "*.markdown" \) -exec grep -l "draft: true" {} \;

publish:
	@echo "📖 Published posts:"
	@find content -type f \( -name "*.md" -o -name "*.markdown" \) ! -exec grep -l "draft: true" {} \; ! -path "*/index.md"

validate:
	@echo "✓ Checking Hugo configuration..."
	@hugo config

new-post:
	@if [ -z "$(NAME)" ]; then \
		echo "❌ Please provide NAME parameter: make new-post NAME=my-post"; \
		exit 1; \
	fi
	@echo "📝 Creating new post: $(NAME)"
	@hugo new posts/$(NAME).md

new-page:
	@if [ -z "$(NAME)" ]; then \
		echo "❌ Please provide NAME parameter: make new-page NAME=my-page"; \
		exit 1; \
	fi
	@echo "📝 Creating new page: $(NAME)"
	@hugo new $(NAME)/index.md

.DEFAULT_GOAL := help
