FROM ghcr.io/getpaseo/paseo:latest

USER root

# opencode v2 + agy. Dejar USER root: el entrypoint baja solo a paseo.
# HOME=/tmp en los checks para no dejar archivos de root en /home/paseo (causa EACCES en runtime).
RUN npm install -g @opencode/cli@latest \
  && curl -fsSL --compressed https://antigravity.google/cli/install.sh | bash -s -- --dir /usr/local/bin \
  && HOME=/tmp agy --version \
  && HOME=/tmp opencode --version \
  && HOME=/tmp paseo --version \
  && chown -R paseo:paseo /home/paseo

LABEL org.opencontainers.image.source="https://github.com/micr0software/micropaseo" \
  org.opencontainers.image.description="Paseo + opencode + agy (Antigravity CLI) multi-arch" \
  org.opencontainers.image.licenses="MIT"
