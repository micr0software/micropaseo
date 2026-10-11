# micropaseo

`ghcr.io/micr0software/micropaseo:latest` — Paseo + `opencode` + `agy` (Antigravity CLI). Multi-arch `amd64/arm64`.

```bash
PASEO_PASSWORD=xxx docker compose up -d --build
# UI: http://<host>:6767
docker compose exec paseo agy --version
docker compose exec paseo opencode --version
```
