#!/bin/bash

serve_pages() {
    echo "🚀 Starting Hugo development server..."
    if [ -n "${CODESPACE_NAME:-}" ]; then
        echo "🌐 Detected Codespace environment. Binding to public URL..."
        hugo server -b "https://${CODESPACE_NAME}-1313.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}" -p 1313 --appendPort=false --disableFastRender
    else
        echo "🌐 Running locally at http://localhost:1313"
        hugo server --buildDrafts --buildFuture
    fi
}
