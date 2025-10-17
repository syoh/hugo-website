FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Install Hugo (Extended version for SCSS support)
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install Hugo Extended
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.147.2/hugo_extended_0.147.2_linux-amd64.tar.gz && \
    tar -zxvf hugo_extended_0.147.2_linux-amd64.tar.gz && \
    mv hugo /usr/local/bin/ && \
    rm hugo_extended_0.147.2_linux-amd64.tar.gz && \
    hugo version

# Install additional development tools
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    nodejs \
    npm \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js development tools (optional, for asset processing)
RUN npm install -g \
    postcss \
    postcss-cli \
    autoprefixer

# Verify installations
RUN hugo version && \
    node --version && \
    npm --version && \
    git --version
