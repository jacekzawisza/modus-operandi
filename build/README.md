# Build-Setup

Erzeugt aus den Markdown-Dateien (`README.md`, `modus-operandi.md`, `building-with-ai.md`) ein PDF unter `dist/modus-operandi.pdf`.

## Lokal bauen

Voraussetzung: `pandoc` und `xelatex` (TeX Live) installiert.

```bash
# macOS
brew install pandoc
brew install --cask mactex-no-gui  # oder basictex

# Build
bash build/build-pdf.sh
```

Output: `dist/modus-operandi.pdf` mit Cover (Titel + Version + Build-Datum + Commit-Hash), Inhaltsverzeichnis und allen drei Markdown-Inhalten gemerged.

## Automatischer Build via GitHub Action

`.github/workflows/build-pdf.yml` läuft bei jedem Push auf `main` und:

1. Baut das PDF mit Pandoc auf Ubuntu
2. Checkt das `prof-z-website`-Repo aus (per PAT)
3. Kopiert das PDF nach `prof-z-website/modus-operandi.pdf`
4. Committed und pusht — Cloudflare Pages re-deployt automatisch

## Setup-Schritte (einmalig)

### 1. Personal Access Token (PAT) generieren

GitHub → **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)** → **Generate new token (classic)**

- Note: `modus-operandi-pdf-deploy`
- Expiration: 1 year (Reminder im Kalender setzen!)
- Scope: **`repo`** (full control of private repositories)
- Generate → Token kopieren (wird nur einmal angezeigt)

### 2. PAT als Secret in diesem Repo hinterlegen

`github.com/jacekzawisza/modus-operandi` → **Settings** → **Secrets and variables** → **Actions** → **New repository secret**

- Name: `PROF_Z_WEBSITE_PAT`
- Value: *(das PAT)*
- **Add secret**

### 3. Action manuell triggern (zum Testen)

`github.com/jacekzawisza/modus-operandi/actions` → **Build PDF and deploy** → **Run workflow** → **main** → **Run workflow**

Nach ~2 Min:
- Action ist grün
- PDF liegt in `jacekzawisza/prof-z-website/modus-operandi.pdf`
- Cloudflare Pages re-deployt automatisch
- PDF ist live unter `https://prof-z.com/modus-operandi.pdf`

## Versionierung

Vor größeren Inhalts-Updates die `VERSION`-Datei manuell hochzählen:

- **Major** (1.x → 2.x): grundlegende Methodik-Änderungen
- **Minor** (1.0 → 1.1): neue Sections, Inhalts-Ergänzungen
- **Patch** (1.0.0 → 1.0.1): Tippfehler, kleine Klarstellungen

Die aktuelle Version steht im PDF-Cover ("v1.0.0 · Build 2026-MM-DD · Commit xxxxxxx").

## Was die Action triggert (Pfad-Filter)

- Änderungen an `*.md` (alle Markdown-Files im Root)
- Änderungen an `VERSION`
- Änderungen in `build/**`
- Manueller Trigger via `workflow_dispatch`

Änderungen in `templates/`, `.git*`, etc. triggern den Build **nicht**.
