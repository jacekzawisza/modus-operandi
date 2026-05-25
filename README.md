# Modus Operandi — AI-natives Operating Model für Solo-Builder und kleine Teams

Ein dokumentationsgetriebenes Operating Model für AI-natives Bauen — als Einzelperson oder im Kleinteam (1–5 Personen). Inspiriert von Dave Blundins AI-lesbarem Betriebssystem (Moonshots-Podcast EP #235 + #238) und der Agentic-Coding-Praxis 2025/2026.

## Was ist das?

Zwei Dokumente + sofort nutzbare Templates. Beide adressieren Solo + Team:

- **[modus-operandi.md](modus-operandi.md)** — Das **Operating Model**: 6 Artefakt-Typen (inkl. backlog.md, results.md), Projekt-Lebenszyklus, Session-Workflow, Meeting-Rhythmus, Eskalationsregeln, Bewertungslogik, 7 Prinzipien. *Wie arbeitet ihr.*
- **[building-with-ai.md](building-with-ai.md)** — Der **Builder-Guide**: Mindset, Setup, PRD-Prozess, Karpathy-Prinzipien, Session-Schleife, Specification Engineering, häufige Fallen, Projektlebenszyklus. *Wie baust du konkret.*

## Für wen?

- Solo-Builder, Gründer, Wissensarbeiter, die mit KI eigene Produkte bauen
- Kleine Teams (2–5 Personen), die mit Claude Software bauen
- Projektleiter, die ein leichtgewichtiges, Git-basiertes PM-System suchen
- Nicht-Entwickler, die ohne Dev-Team eigene Software auf die Beine stellen

## Wie nutzt man es?

### Quick-Start

1. **Lies** [modus-operandi.md](modus-operandi.md) (Operating Model) und [building-with-ai.md](building-with-ai.md) (Builder-Guide)
2. **Kopiere** die Templates in dein Projekt-Repo:

   **Solo-Projekt:**
   ```bash
   cp templates/CLAUDE.md dein-projekt/CLAUDE.md
   cp templates/prd.md dein-projekt/docs/prd.md
   cp templates/decisions.md dein-projekt/docs/decisions.md
   # Optional, ab ~15 Features oder mehreren Feature-Quellen:
   # cp templates/backlog.md dein-projekt/docs/backlog.md
   # Nur wenn parallele Doc-Edits Konflikte erzeugen (mehrere Worktrees etc.):
   # cp templates/inbox.md dein-projekt/docs/INBOX.md
   mkdir -p dein-projekt/docs/meetings dein-projekt/docs/results
   ```

   **Team-Projekt:**
   ```bash
   cp templates/CLAUDE.md dein-projekt/CLAUDE.md
   cp templates/prd.md dein-projekt/docs/prd.md
   cp templates/decisions.md dein-projekt/docs/decisions.md
   cp templates/inbox.md dein-projekt/docs/INBOX.md
   cp templates/mission.md dein-projekt/docs/team/[name]-mission.md
   # Optional, ab ~15 Features oder mehreren Feature-Quellen:
   # cp templates/backlog.md dein-projekt/docs/backlog.md
   mkdir -p dein-projekt/docs/meetings dein-projekt/docs/results
   ```
3. **Passe an:** Fülle die Platzhalter in den Templates aus
4. **Optional:** Kopiere `modus-operandi.md` in dein Projekt-Repo (`docs/modus-operandi.md` bei Solo, `docs/team/modus-operandi.md` bei Team) und passe den Abschnitt "Projektspezifische Anpassung" an

### Oder: Lass Claude die Anpassung machen

```
Lies modus-operandi.md und erstelle eine projektspezifische Version
für unser Projekt [Name]. Wir sind [Teamgröße] Personen,
kommunizieren über [Kanal], treffen uns [Rhythmus].
```

## Templates

| Template | Zweck |
|----------|-------|
| [CLAUDE.md](templates/CLAUDE.md) | KI-Briefing pro Projekt (< 200 Zeilen) |
| [prd.md](templates/prd.md) | Product Requirements Document — WAS bauen wir + WARUM, Phasen-Narrative |
| [backlog.md](templates/backlog.md) | Feature-Registry mit stabilen IDs + Phase-Spalte (optional, ab ~15 Features) |
| [decisions.md](templates/decisions.md) | Architektur-Entscheidungslog |
| [results.md](templates/results.md) | Outcome-Notiz pro Feature nach Go-Live (Lern-Schicht) |
| [mission.md](templates/mission.md) | Mission-Dokument pro Teammitglied (nur Team) |
| [meeting-note.md](templates/meeting-note.md) | Strukturierte Meeting-Notiz (Kunden + Team) |
| [inbox.md](templates/inbox.md) | Append-Only-Briefkasten für parallele Doc-Edits (Team-Pflicht, Solo-optional) |

## Kern-Ideen

- **Artefakte > Meetings** — Wenn es nicht aufgeschrieben ist, existiert es nicht
- **Markdown = Single Source of Truth** — Kein Notion, kein Jira. Alles im Repo
- **Claude ist Teammitglied** — Arbeit wird so dokumentiert, dass AI Kontext daraus ableiten kann
- **Output > Input** — Ergebnisse messen, nicht Stunden
- **Kontext > Kontrolle** — Dokumentation für Klarheit, nicht Überwachung

## Lizenz

MIT
