#!/usr/bin/env bash
#
# Build modus-operandi.pdf from Markdown sources.
# Runs locally (with pandoc + xelatex installed) and in GitHub Actions.
#
# Output: dist/modus-operandi.pdf
#

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

VERSION="$(cat VERSION 2>/dev/null || echo "0.0.0")"
BUILD_DATE="$(date -u +%Y-%m-%d)"
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo "dev")"

mkdir -p dist

echo "Building modus-operandi.pdf (v${VERSION}, ${BUILD_DATE}, ${COMMIT})..."

pandoc \
  --pdf-engine=xelatex \
  --from=markdown+smart \
  --metadata title="Modus Operandi" \
  --metadata subtitle="v${VERSION} · Build ${BUILD_DATE} · Commit ${COMMIT}" \
  --metadata author="Jacek Zawisza" \
  --metadata lang=de \
  -V geometry:margin=2.5cm \
  -V mainfont="DejaVu Sans" \
  -V sansfont="DejaVu Sans" \
  -V monofont="DejaVu Sans Mono" \
  -V fontsize=11pt \
  -V documentclass=article \
  -V colorlinks=true \
  -V linkcolor="[HTML]{155F2A}" \
  -V urlcolor="[HTML]{155F2A}" \
  -V toccolor="[HTML]{155F2A}" \
  --toc --toc-depth=2 \
  --output="dist/modus-operandi.pdf" \
  README.md \
  modus-operandi.md \
  building-with-ai.md

echo "✓ dist/modus-operandi.pdf gebaut"
ls -lh dist/modus-operandi.pdf
