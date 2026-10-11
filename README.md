# micropaseo

`ghcr.io/micr0software/micropaseo:latest` — Paseo + `opencode` v2 (`@opencode/cli`) + `agy` (Antigravity CLI). Multi-arch `amd64/arm64`.

Paseo corre el daemon y los agentes como usuario non-root `paseo` (`1000:1000`). La imagen hija se deja en `root` a propósito: el entrypoint base hace el setup inicial y luego baja solo a `paseo`. No forzar todo a `root` en runtime. Ver `https://paseo.sh/docs/docker` y `https://paseo.sh/docs/security`.

OpenCode: `opencode-ai` es la línea v1 (`1.19.x`). Aquí se usa `@opencode/cli` línea v2 (`2.0.x`). Paseo soporta v2 desde el fix `getpaseo/paseo#5198` (2026-09-26, issue `#4878`); si ves `Failed to fetch OpenCode providers: {}`, rebuildea la base.

```bash
mkdir -p paseo-home workspace
sudo chown -R 1000:1000 paseo-home workspace
PASEO_PASSWORD=xxx docker compose up -d --build
# UI: http://<host>:6767
docker compose exec paseo agy --version
docker compose exec paseo opencode --version
```
