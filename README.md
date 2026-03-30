# Modus Operandi — AI-lesbares Betriebssystem für Teams

Ein dokumentationsgetriebenes Operating Model für kleine Teams, die mit Claude arbeiten. Inspiriert von Dave Blundins AI-lesbarem Betriebssystem (Moonshots-Podcast EP #235 + #238).

## Was ist das?

Zwei Dokumente + sofort nutzbare Templates, die definieren **wie** ein Team mit KI-Unterstützung zusammenarbeitet:

- **[modus-operandi.md](modus-operandi.md)** — Das Operating Model: 6 Artefakt-Typen, Session-Workflow, Meeting-Rhythmus, Eskalationsregeln, Bewertungslogik, 7 Prinzipien
- **[vibe-coding-guide.md](vibe-coding-guide.md)** — Der Praxis-Guide für Nicht-Entwickler: Mindset, Setup, PRD-Prozess, Session-Schleife, Specification Engineering, Team-Erweiterung

## Für wen?

- Kleine Teams (2-5 Personen), die mit Claude Software bauen
- Solo-Entwickler, die Struktur in ihre KI-Sessions bringen wollen
- Projektleiter, die ein leichtgewichtiges, Git-basiertes PM-System suchen
- Nicht-Entwickler, die mit Vibe Coding eigene Produkte bauen

## Wie nutzt man es?

### Quick-Start

1. **Lies** [modus-operandi.md](modus-operandi.md) und [vibe-coding-guide.md](vibe-coding-guide.md)
2. **Kopiere** die Templates in dein Projekt-Repo:
   ```bash
   cp templates/CLAUDE.md dein-projekt/CLAUDE.md
   cp templates/product.md dein-projekt/docs/PRODUCT.md
   cp templates/decisions.md dein-projekt/docs/DECISIONS.md
   # Bei Team-Projekten:
   cp templates/mission.md dein-projekt/docs/team/[name]-mission.md
   cp templates/inbox.md dein-projekt/docs/INBOX.md
   ```
3. **Passe an:** Fülle die Platzhalter in den Templates aus
4. **Optional:** Kopiere `modus-operandi.md` in dein Projekt-Repo und passe den Abschnitt "Projektspezifische Anpassung" an

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
| [product.md](templates/product.md) | Product Requirements Document (PRD) |
| [decisions.md](templates/decisions.md) | Architektur-Entscheidungslog |
| [mission.md](templates/mission.md) | Mission-Dokument pro Teammitglied |
| [meeting-note.md](templates/meeting-note.md) | Strukturierte Meeting-Notiz |
| [inbox.md](templates/inbox.md) | Offene Änderungen aus Meetings |

## Kern-Ideen

- **Artefakte > Meetings** — Wenn es nicht aufgeschrieben ist, existiert es nicht
- **Markdown = Single Source of Truth** — Kein Notion, kein Jira. Alles im Repo
- **Claude ist Teammitglied** — Arbeit wird so dokumentiert, dass AI Kontext daraus ableiten kann
- **Output > Input** — Ergebnisse messen, nicht Stunden
- **Kontext > Kontrolle** — Dokumentation für Klarheit, nicht Überwachung

## Lizenz

MIT
