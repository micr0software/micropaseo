FROM ghcr.io/getpaseo/paseo:latest

USER root

# opencode (latest via npm) + agy CLI / Antigravity (latest via official installer).
# Install script auto-detecta amd64/arm64, por eso el mismo Dockerfile sirve para multi-arch.
RUN npm install -g opencode-ai@latest \
  && curl -fsSL https://antigravity.google/cli/install.sh | bash -s -- --dir /usr/local/bin \
  && agy --version \
  && opencode --version \
  && paseo --version

LABEL org.opencontainers.image.source="https://github.com/micr0software/micropaseo" \
  org.opencontainers.image.description="Paseo + opencode + agy (Antigravity CLI) multi-arch" \
  org.opencontainers.image.licenses="MIT"
