# Modus Operandi — AI-lesbares Betriebssystem für Teams

_Stand: März 2026 | Jacek Zawisza_

---

## Projektspezifische Anpassung

Dieses Dokument ist eine **universelle Vorlage**. Bei der Übernahme in ein konkretes Projekt müssen folgende Punkte angepasst werden:

- [ ] **Projektname & Repo** — Ersetze Platzhalter durch euren Projektnamen und Repo-URL
- [ ] **Deadline** — Eure zentrale Deadline eintragen
- [ ] **Teammitglieder & Rollen** — Wer macht was? Mission-Dokumente pro Person anlegen
- [ ] **Kommunikationskanäle** — Welche Kanäle nutzt ihr? (Slack, Discord, Telegram, etc.)
- [ ] **Meeting-Rhythmus** — Eure konkreten Termine und Frequenzen eintragen
- [ ] **Solo vs. Team** — Bei Solo-Projekten entfallen: Team-Meetings, Eskalationsregeln, Bot-Integration, Mission-Dokumente. Kundenmeetings bleiben relevant.

> **Tipp:** Lass Claude die Anpassung machen. Gib ihm dieses Dokument + eine kurze Projektbeschreibung und er erstellt die projektspezifische Version.

---

## Woher kommt die Idee?

Dave Blundin (Link Ventures, Co-Host "Moonshots with Peter Diamandis", EP #235) beschreibt ein Operating Model, in dem:

1. **Jeder Prozess eine schriftliche Mission hat** — neben dem Code, nicht nur in Köpfen
2. **Alles Relevante in AI-lesbaren Artefakten steht** — keine "opaken" Aktivitäten in Meetings, WhatsApp oder Flurgesprächen
3. **AI aktiv mitarbeitet** — Meetings vorschlagen, davon abraten, Infos liefern, Koordination steuern

Das ist kein "AI beobachtet Mitarbeiter heimlich", sondern: **Arbeit wird absichtlich so dokumentiert, dass AI daraus Kontext, Status, Entscheidungen und nächste Schritte ableiten kann.** Der Hebel ist nicht das Modell, sondern die **Disziplin der Artefakte.**

### Wer macht es ähnlich?

| Ansatz | Kern-Idee | Relevant für uns |
|--------|-----------|-----------------|
| **GitLab Handbook-First** | Alles steht im Handbook (öffentlich, Markdown). Kein Meeting ohne Agenda, kein Beschluss ohne MR. | Ja — wir machen das mit Git statt Notion |
| **BMAD Framework** | AI-getriebene Entwicklung mit Pflicht-Artefakten: PRD, Architecture Sketch, User Stories — BEVOR Code geschrieben wird | Ja — genau unser Ansatz mit architecture.md + CLAUDE.md |
| **ccpm (Claude Code Project Manager)** | Markdown-basiertes PM im Repo. PRDs, Epics, Tasks als `.md`-Dateien. Git = Changelog. | Ja — wir machen eine leichtere Version davon |
| **Spec-Driven Development** | Specs als "Single Source of Truth" — AI liest Specs, schreibt Code, Mensch validiert | Ja — unser architecture.md + mission-docs |
| **Atlassian Rovo** | AI-Agenten mit kuratiertem Zugriff auf bestimmte Confluence/Jira-Bereiche | Prinzip ja — wir scopen über CLAUDE.md was Claude sieht |

### Was wir NICHT machen (EU AI Act + Datenschutz)

**Klare Grenze:** Dieses System ist Arbeitsdokumentation zur Koordination — KEIN Mitarbeitertracking zur Leistungs- oder Verhaltenskontrolle.

- Keine automatische Überwachung von Arbeitszeiten oder Commit-Frequenz
- Keine AI-basierte Bewertung von Mitarbeitern
- Keine Emotionserkennung (explizit verboten seit Feb 2025, EU AI Act)
- Keine verdeckte Datenerfassung
- Status-Updates sind **freiwillige, selbst-dokumentierte** Artefakte

Seit dem EU AI Act gelten für KI am Arbeitsplatz besondere Regeln. Systeme im Bereich "employment / workers' management" können als Hochrisiko eingestuft werden. Deshalb: Wir verkaufen das nicht als "Tracking", sondern als **weniger Sucherei, weniger Doppelarbeit, weniger unnötige Meetings, sauberere Übergaben.**

### Claude Code Teams Usage Tracking (Optional)

Für Teams die Claude Code intensiv nutzen: Das **Teams-Dashboard** (`claude.ai/analytics/claude-code`) bietet Usage-Metriken und Contribution-Tracking via GitHub-Integration.

**Empfehlung:**
- **Setup:** GitHub-App installieren, Team einladen
- **Metriken:** Tokens, Sessions, PRs, Lines of Code mit Claude-Hilfe
- **Zweck:** Prozess-Optimierung, nicht individuelle Bewertung
- **Datenschutz:** Aggregierte Daten, keine persönliche Leistungsüberwachung

---

## Unser Setup: 6 Artefakt-Typen

Inspiriert von Blundins Ansatz, kombiniert mit dem [Vibe Coding Guide](vibe-coding-guide.md) für die technischen Artefakte. Die Team-Ebene ergänzt die Projekt-Ebene — beides zusammen ergibt das AI-lesbare Betriebssystem.

### 0. Security-Review (regelmäßig)

**Was:** Systematische Sicherheitsprüfung der Codebase mit Claude Code.
**Befehl:** `/security-review` in Claude Code
**Frequenz:** Alle 2-4 Wochen oder vor jedem größeren Release
**Output:** Liste von Schwachstellen mit Priorisierung und Fix-Empfehlungen
**Dokumentation:** Ergebnisse in `docs/audit/security-YYYY-MM-DD.md` speichern

> Siehe [Vibe Coding Guide](vibe-coding-guide.md#falle-5-security-vernachlässigen) für Details.

### 0b. Secrets & Zugangsdaten — Niemals in KI-Konversationen teilen

**Regel:** API-Keys, Passwörter, Tokens und andere Geheimnisse dürfen **niemals** in Konversationen mit KI-Modellen (Claude, ChatGPT, Copilot, etc.) geteilt werden.

**Warum:**
- KI-Konversationen können in Logs, Trainingsdaten oder Cloud-Speicher landen
- Auch bei "privaten" Sessions gibt es keine Garantie, dass der Inhalt nicht gespeichert wird
- Ein einmal geteiltes Secret ist als kompromittiert zu betrachten

**Wenn es doch passiert ist:**
1. **Sofort den Key/das Passwort rotieren** — nicht "irgendwann", sondern jetzt
2. Neuen Key generieren und sicher ablegen (`.env`, Passwort-Manager, etc.)
3. Prüfen ob der alte Key in Git-History gelandet ist → ggf. `git filter-branch` oder BFG Repo-Cleaner

**Best Practices:**
- Secrets gehören in `.env`-Dateien (gitignored) oder Passwort-Manager (1Password, Bitwarden)
- In KI-Konversationen stattdessen Platzhalter verwenden: `$API_KEY`, `<your-token-here>`
- `.env.example` mit Platzhaltern ins Repo committen, nie `.env` selbst
- Bei Code-Reviews: Auf hardcodierte Secrets prüfen (Teil des Security-Reviews)

### 1. Mission-Dokument (pro Person)

**Was:** Ein Einseiter pro Teammitglied im Repo. Ziel, aktueller Stand, nächste Schritte, Blocker.
**Wo:** `docs/team/[name]-mission.md`
**Wer aktualisiert:** Das Teammitglied selbst (täglich/bei Änderung)
**Wer liest:** Mensch (im Meeting) + AI (Claude, automatisch via CLAUDE.md)

> Vorlage: [templates/mission.md](templates/mission.md)

```markdown
# Mission: [Name] — [Projekt]

## Mein Auftrag
1-3 Sätze: Was ist mein Ziel? Woran erkennt man Erfolg?

## Aktuelle Phase
Meilenstein | Deadline | Status

## Wochenplan
| Aufgabe | Deliverable | Status |

## Blocker & Fragen
Was ich alleine nicht lösen kann.

## Entscheidungen (Log)
Datum — Was — Wer — Warum
```

**Warum das funktioniert:**
- Claude liest es automatisch → weiß was gerade dran ist
- Projektleitung scannt in 2 Minuten den Status
- Blocker-Liste = Agenda fürs Meeting → keine Vorbereitung nötig
- Entscheidungs-Log = warum wir etwas so gemacht haben → kein "haben wir das nicht anders besprochen?"

### 2. Meeting-Notiz (pro Meeting)

**Was:** Jedes Meeting produziert ein strukturiertes Ergebnis-Dokument.
**Wo:** `docs/meetings/YYYY-MM-DD-thema.md`
**Wer erstellt:** Wer das Meeting leitet (5 Min nach dem Meeting, nicht mehr)

> Vorlage: [templates/meeting-note.md](templates/meeting-note.md)

```markdown
# Meeting: [Thema] | [Datum]

## Teilnehmer
- ...

## Entscheidungen
- [ Entscheidung ] — Begründung — Verantwortlich — Frist

## Action Items
- [ ] [Was] — [Wer] — [Bis wann]

## Offene Fragen
- ...
```

**Regel:** Kein Meeting ohne Ergebnis-Dokument. Wenn nach 5 Min nichts aufzuschreiben ist, war das Meeting unnötig.

**Warum das funktioniert:**
- Claude kann vorherige Meeting-Notizen lesen → Kontext für aktuelle Arbeit
- Action Items werden zu Wochenplan-Einträgen im Mission-Dokument
- Entscheidungen werden nachvollziehbar (wann, wer, warum)
- Weniger "das haben wir doch besprochen" — es steht geschrieben

### 2b. Meeting-Transkripte

**Was:** Vollständige Aufnahme + Transkription von Meetings als Rohmaterial.
**Wo:** `docs/meetings/transcripts/YYYY-MM-DD-thema.md`
**Wer erstellt:** Wer das Meeting leitet (Aufnahme starten, automatisch transkribieren)
**Tooling:** Deepgram / Whisper oder beliebiges Transkriptions-Tool

**Workflow:**

```
1. AUFNEHMEN → Transkript erstellen (automatisch, z.B. ChatGPT, Deepgram, Whisper)

2. DESTILLIEREN → KI-Zusammenfassung erstellen lassen
   KI liest Transkript → erstellt strukturierte Zusammenfassung
   (Entscheidungen, Action Items, offene Fragen)

3. KORRIGIEREN → Zusammenfassung kurz gegenchecken
   Sprecherzuordnung prüfen, offensichtliche Fehler korrigieren
   Zeitaufwand: 2-5 Minuten

4. HOCHLADEN → Nur die Zusammenfassung ins Repo
   Ablage: docs/meetings/YYYY-MM-DD-thema.md
   Das ist das Artefakt das Claude liest und das Team nutzt
```

**Warum nur Zusammenfassung, kein volles Transkript ins Repo?**
- Transkripte haben oft fehlerhafte Sprecherzuordnung → Rauschen im Repo
- Zusammenfassung = destilliertes Arbeits-Artefakt: kurz, strukturiert, actionable
- Transkript lokal behalten als Backup (bei "Das hab ich so nie gesagt")
- Weniger Token-Verbrauch wenn Claude das Repo liest

**Welche Meetings:**

- **Jour fixe (intern, nur Team):** Zusammenfassung ins Repo
- **Arbeitstermin:** Zusammenfassung ins Repo (bei Architektur-Entscheidungen)
- **Kunden-/Stakeholder-Meeting:** Zusammenfassung ins Repo (Kundenwünsche = wichtig)
- **Ad-hoc Calls:** Nur Notiz, nur wenn eine Entscheidung fiel

### 2c. INBOX.md — Brücke zwischen Meetings und Code-Sessions

**Was:** Eine Datei im Repo, die offene Änderungen aus Meetings sammelt, die noch in die Projekt-Docs übernommen werden müssen.
**Wo:** `docs/INBOX.md`
**Wer schreibt rein:** Projektleitung oder Bot (nach Meeting-Destillation)
**Wer arbeitet ab:** Teammitglieder (beim nächsten Session-Abschluss)
**Wer liest mit:** Claude (beim Session-Start)

> Vorlage: [templates/inbox.md](templates/inbox.md)

**Warum?**
Nach Meeting-Destillation fallen Erkenntnisse an, die in andere Docs gehören (neue Entscheidungen → `decisions.md`, neue Aufgaben → Aufgabenplan, Feature-Anforderungen → `product.md`). Statt direkt in diese Docs zu schreiben (Merge-Konflikt-Risiko mit laufenden Claude-Sessions), wird alles in `INBOX.md` gesammelt.

**Format:**
```markdown
# INBOX.md — Offene Änderungen aus Meetings

## 2026-03-26 — Jour fixe
- [ ] decisions.md: Feature X ergänzen
- [ ] aufgaben.md: Neue Aufgabe Y
- [ ] product.md: Anforderung Z dokumentieren
→ Quelle: docs/meetings/2026-03-26-jourfixe.md
```

**Workflow:**
1. Nach Meeting: INBOX.md mit offenen Punkten aktualisieren
2. Optional: Heads-up im Team-Kanal ("INBOX.md hat offene Punkte")
3. Bei der nächsten Claude-Session: Session-Abschluss übernimmt die Punkte
4. Erledigte Einträge werden aus INBOX.md gelöscht

**Regel:** `INBOX.md` leer = alles synchron. Nicht leer = es gibt Nachholbedarf.

### 3. Architektur-Dokument (pro Projekt)

**Was:** Technische Wahrheit des Projekts. Datenmodell, Seitenstruktur, Stack, Entscheidungen.
**Wo:** `docs/architecture.md`
**Wer aktualisiert:** Wer Architektur-Entscheidungen trifft
**Wird gelesen von:** Claude (automatisch), Team-Mitglieder

### 4. product.md / PRD (pro Projekt)

**Was:** Das Product Requirements Document — definiert WAS gebaut wird, WARUM und WANN. Enthält auch die Roadmap mit Meilensteinen und Status-Tracking.
**Wo:** `docs/product.md`
**Wer erstellt:** Projektleitung, idealerweise vor Projektstart
**Wer aktualisiert:** Nach jeder Session (Meilensteine) + bei Scope-Änderungen (Features)
**Enthält:** Problem, Zielgruppe, Kernfunktionen mit Phasen/Meilensteinen, Nicht-Ziele, Tech-Stack, Erfolgskriterien, Risiken

> Vorlage: [templates/product.md](templates/product.md)

**Warum PRD + Roadmap in einem Dokument?** Bei Solo- und Kleinteam-Projekten entscheidet dieselbe Person WAS und WANN gebaut wird. Zwei getrennte Dokumente (product.md + roadmap.md) verdoppeln den Pflegeaufwand ohne Mehrwert. Features sind nach Phasen priorisiert — das "Wann" ist direkt an das "Was" gekoppelt.

> **Hinweis:** Bei größeren Teams (>5 Personen), wo Produkt-Scope und Timeline von verschiedenen Rollen gemanagt werden, kann eine separate `roadmap.md` sinnvoll sein.

**Aus dem Vibe Coding Guide:** Vor der Umsetzung das PRD von der KI challengen lassen (2-3 Runden). Die KI deckt Lücken auf.

### 5. decisions.md (pro Projekt)

**Was:** Chronologisches Log aller Architektur- und Produktentscheidungen auf Projekt-Level.
**Wo:** `docs/decisions.md`
**Wer aktualisiert:** Wer die Entscheidung trifft (nach jeder Session)

> Vorlage: [templates/decisions.md](templates/decisions.md)

```markdown
## 2026-03-24 — Titel der Entscheidung

**Kontext:** Warum mussten wir entscheiden?

### Entscheidung
Was haben wir entschieden?

### Alternativen verworfen
- Option A: Warum nicht?
- Option B: Warum nicht?

### Konsequenzen
- Positiv
- Negativ / Risiken
```

**Unterschied zu Entscheidungen im Mission-Dokument:** Mission-Doc = persönliche/aufgabenbezogene Entscheidungen ("Ich habe X so gelöst"). decisions.md = Projekt-Architektur ("Wir nutzen PostgreSQL weil..."). Claude liest beides.

### 6. CLAUDE.md (pro Projekt)

**Was:** Das "Briefing" für Claude. Projektkontext, Team, Stack, Standards, Verweise auf andere Artefakte.
**Wo:** Repository-Root
**Wer aktualisiert:** Projektleitung (selten, nur bei großen Änderungen)

> Vorlage: [templates/CLAUDE.md](templates/CLAUDE.md)

```markdown
# CLAUDE.md — [Projektname]

## Projekt
Kurzbeschreibung in 1-2 Sätzen.

## Deadline
TT.MM.JJJJ — Kontext zur Deadline.

## Team
<!-- Nur bei Team-Projekten. Bei Solo-Projekten diesen Abschnitt entfernen. -->
→ Lies docs/team/[name]-mission.md für aktuellen Status.

## Was bauen wir?
→ Lies docs/product.md (PRD)

## Tech-Stack + Standards
→ Lies docs/architecture.md

## Architektur-Entscheidungen
→ Lies docs/decisions.md

## Arbeitsweise
→ Lies docs/modus-operandi.md              # Solo
→ Lies docs/team/modus-operandi.md         # Team

## Coding-Konventionen
- [Projekt-spezifische Regeln hier]
```

**Der Trick:** CLAUDE.md ist kurz (< 200 Zeilen) und verweist auf die anderen Artefakte. So bleibt es wartbar und Claude lädt nur was es braucht. Konventionen und Gotchas gehören direkt rein (damit Claude sie sofort sieht), alles andere wird verlinkt.

---

## Vollständige Dokument-Landschaft

### Solo-Projekt

```
dein-projekt/
├── CLAUDE.md                        # AI-Briefing (< 200 Zeilen)
│
├── docs/
│   ├── INBOX.md                     # Offene Änderungen aus Meetings
│   ├── product.md                   # PRD — Was und Warum
│   ├── architecture.md              # Stack, Datenmodell, Seitenstruktur
│   ├── decisions.md                 # Architektur-Entscheidungen (chronologisch)
│   ├── modus-operandi.md            # Dieses Dokument (projektspezifische Version)
│   │
│   ├── meetings/                    # Kundenmeetings, Stakeholder-Calls
│   │   ├── YYYY-MM-DD-*.md          # Destillierte Notizen
│   │   └── transcripts/             # Vollständige Transkripte
│   │       └── YYYY-MM-DD-*.md
│   │
│   ├── concepts/                    # Feature-Konzepte (vor Implementierung)
│   └── audit/                       # Codebase-Audit-Berichte
```

### Team-Projekt

```
dein-projekt/
├── CLAUDE.md                        # AI-Briefing (< 200 Zeilen)
│
├── docs/
│   ├── INBOX.md                     # Offene Änderungen aus Meetings
│   ├── product.md                   # PRD — Was und Warum
│   ├── architecture.md              # Stack, Datenmodell, Seitenstruktur
│   ├── decisions.md                 # Architektur-Entscheidungen (chronologisch)
│   │
│   ├── meetings/                    # Alle Meetings (intern + extern)
│   │   ├── YYYY-MM-DD-*.md          # Destillierte Notizen
│   │   └── transcripts/             # Vollständige Transkripte
│   │       └── YYYY-MM-DD-*.md
│   │
│   ├── team/                        # Team-Koordination
│   │   ├── modus-operandi.md        # Dieses Dokument (projektspezifische Version)
│   │   ├── [name]-mission.md        # Mission-Dokument pro Person
│   │   └── [name]-aufgaben.md       # Detaillierter Aufgabenplan (optional)
│   │
│   ├── concepts/                    # Feature-Konzepte (vor Implementierung)
│   └── audit/                       # Codebase-Audit-Berichte
```

### Die Logik
- **CLAUDE.md** = AI liest das zuerst → verweist auf alles andere
- **docs/*.md** = Projekt-Artefakte → WAS bauen wir?
- **docs/meetings/** = Kundenmeetings + Team-Meetings → WAS wurde besprochen?
- **docs/team/*.md** = Team-Artefakte (nur bei Team-Projekten) → WER macht WAS?

---

## Wie es zusammenspielt

```
# Solo-Projekt:
CLAUDE.md (Einstieg)
   ├── docs/product.md (WAS bauen wir?)
   ├── docs/architecture.md (WIE bauen wir es?)
   ├── docs/modus-operandi.md (WIE arbeiten wir?)
   └── docs/meetings/*.md (WAS wurde besprochen?)

# Team-Projekt:
CLAUDE.md (Einstieg)
   ├── docs/product.md (WAS bauen wir?)
   ├── docs/architecture.md (WIE bauen wir es?)
   ├── docs/team/[name]-mission.md (WER macht WAS gerade?)
   ├── docs/team/modus-operandi.md (WIE arbeiten wir?)
   └── docs/meetings/*.md (WAS wurde besprochen?)
```

### Täglicher Workflow

```
Teammitglied startet Claude
    ↓
Claude liest CLAUDE.md
    ↓
Claude liest [name]-mission.md → "Ah, Woche 3, Feature X bauen"
    ↓
Claude liest architecture.md → "Ah, diese Route, dieses Datenmodell"
    ↓
Teammitglied sagt: "Baue Feature X"
    ↓
Claude hat ALLEN Kontext → baut die richtige Sache
    ↓
Teammitglied testet, committed, aktualisiert Mission-Dokument: [x] Feature X
```

### Meeting-Workflow

```
Projektleitung öffnet [name]-mission.md
    ↓
Scannt: Status? Wochenplan: Wie viele [x]?
    ↓
Liest: Blocker-Sektion → das wird die Agenda
    ↓
Meeting: Demo → Status → Blocker → Feedback → Next Week
    ↓
Meeting-Notiz in docs/meetings/
    ↓
Action Items → neuer Wochenplan
```

### Wochen-Rhythmus (Vorlage)

| Tag | Teammitglied | Projektleitung |
|-----|-------------|----------------|
| **Mo** | Wochenplan aktualisieren, losbauen | — |
| **Di** | Review: Demo + Status | Status scannen, Feedback geben |
| **Mi** | Bauen | Async: PR reviewen wenn nötig |
| **Do** | Arbeitstermin: Pair-Programming | Zusammen bauen, Blocker lösen |
| **Fr** | Bauen, committen, Status aktualisieren | — |

> Passe die Tage und Zeiten an eure Situation an. Mindestens 1 Review + 1 Arbeitstermin pro Woche.

---

## Session-Workflow (aus dem Vibe Coding Guide)

Jede Coding-Session folgt dem gleichen 5-Schritt-Muster:

```
1. KONTEXT LADEN
   → Claude liest CLAUDE.md → Mission → Architecture
   → "Was ist gerade dran?"

2. AUFGABE DEFINIEREN
   → Klare Beschreibung + Akzeptanzkriterien
   → "Baue Feature X. Akzeptanzkriterien: ..."

3. PLAN ERSTELLEN LASSEN
   → Claude erstellt Plan VOR dem Code
   → "Welche Dateien sind betroffen? Welche Risiken?"
   → Erst nach Review: Implementierung

4. IMPLEMENTIEREN + TESTEN
   → Claude schreibt Code → Teammitglied testet → Feedback-Loop
   → Tests laufen lassen

5. SESSION ABSCHLIEßEN
   → Tests grün?
   → decisions.md aktualisiert (wenn Architektur-Entscheidung)?
   → Mission-Dokument: [x] bei erledigten Aufgaben?
   → Sauberer Commit (feat: / fix: / refactor:)?
   → Ggf. CLAUDE.md um neue Konventionen ergänzt?
   → INBOX.md abgearbeitet? (offene Meeting-Punkte übernommen?)
```

**Raycast-Snippets** (empfohlen — einmal einrichten, immer gleicher Workflow):

**Session-Start** (Kürzel: `;;start`):
```
Ich möchte ein neues Feature umsetzen: {cursor}

Bitte lies zuerst CLAUDE.md für Projektkonventionen, dann docs/INBOX.md für offene Meeting-Punkte. Schau dir danach die relevanten bestehenden Dateien an, um zu verstehen, wie die App aktuell aufgebaut ist. Erstelle dann einen Implementierungsplan mit betroffenen Dateien (neu + bestehend), API-Endpoints (falls nötig) und einer groben Reihenfolge der Schritte. Bitte noch nichts umsetzen — wir besprechen den Plan erst.
```

**Session-Ende** (Kürzel: `;;end`):
```
Bitte Session abschließen:
1. Aktualisiere alle relevanten Dateien in docs/ mit den Änderungen dieser Session
   (z.B. architecture.md, decisions.md, product.md, Konzepte)
2. Aktualisiere Aufgaben- und Mission-Dokumente (erledigte Tasks [x], neue Tasks)
3. Prüfe docs/INBOX.md — wenn offene Punkte existieren, arbeite sie in die
   jeweiligen Docs ein und lösche die erledigten Einträge aus INBOX.md
4. Aktualisiere CLAUDE.md, falls sich Konventionen oder die Projektstruktur geändert haben
5. Gib mir eine Commit-Message (Conventional Commits, Deutsch) — aber committe nicht selbst.
```

**Einrichtung:** Raycast → Extensions → Snippets → Create Snippet → Name + Keyword + Text einfügen. `{cursor}` markiert die Cursor-Position nach dem Einfügen.

**Warum Planen vor Coden?** Claude springt gerne direkt in die Implementierung. Das führt zu Code, der das falsche Problem löst. Erst planen, dann bauen.

---

## Bewertung: Output, nicht Stunden

### Was zählt (Reihenfolge)

1. **Deliverables geliefert?** — Binär. Steht [x] oder steht es nicht?
2. **Qualität?** — Funktioniert es? Sieht es gut aus? Mobile?
3. **Selbständigkeit?** — Wie oft musste die Projektleitung eingreifen?
4. **Kommunikation?** — Blocker rechtzeitig gemeldet? Status aktuell?

### Traffic-Light

| On Track | At Risk | Blocked |
|----------|---------|---------|
| Meilensteine werden erreicht | Meilenstein in Gefahr, aber lösbar | Ohne Hilfe geht's nicht weiter |
| Weiter so | Arbeitstermin nutzen, ggf. Scope anpassen | **Sofort** eskalieren |

### Wann wird es kritisch?

- 2 Wochen hintereinander "At Risk" → Erwartungen kalibrieren
- 1 Woche "Blocked" ohne Eskalation → Grundsatz-Gespräch über Kommunikation
- Mission-Dokument > 5 Tage nicht aktualisiert → Nachfragen

---

## Codebase-Audits (alle 2 Wochen)

Im Arbeitstermin, alle 2 Wochen:

```
Prompt an Claude: "Führe ein Codebase-Audit durch. Prüfe auf:
fehlende Error-Handling, hardcodierte Strings, tote Referenzen,
fehlende Input-Validierung, inkonsistente Patterns.
Erstelle einen Bericht in docs/audit/YYYY-MM-DD.md"
```

Ergebnis: Bericht in `docs/audit/`. Gefundene Issues werden zu Aufgaben im Wochenplan.

---

## Eskalations-Regeln

| Situation | Teammitglied | Projektleitung |
|-----------|-------------|----------------|
| Tech-Problem < 2h | Selbst lösen mit Claude | — |
| Tech-Problem > 2h | Blocker-Sektion aktualisieren | Im Arbeitstermin lösen |
| Architektur-Frage | Optionen + Empfehlung aufschreiben | Entscheidet |
| Externer Blocker | Dokumentieren, Projektleitung informieren | Kümmert sich |
| Deadline gefährdet | **SOFORT** melden | Scope anpassen |

---

## Kommunikation: Klare Kanaltrennung

### Übersicht

| Kanal | Zweck | Kontext |
|-------|-------|---------|
| **Privater Kanal** (z.B. Signal, Telegram) | Strategie, Feedback, Vertrauliches | Nicht für Projekt-Kommunikation |
| **Team-Kanal** (z.B. Slack, Discord) | Projekt: Blocker, Fragen, Status | Projekt-Kontext only |
| **Git-Repo** | Source of Truth: Entscheidungen, Architektur, Status | Dauerhaft, versioniert |

### Faustregel: Was gehört wohin?

- **Flüchtig** (Frage, Blocker, "bin fertig für heute") → **Team-Kanal**
- **Dauerhaft** (Entscheidung, Status-Update, Architektur) → **Git** (Mission-Doc, decisions.md)
- **Privat** (Strategie, Finanzen, Feedback über Personen) → **Privater Kanal**

### Bot-Integration (optional)

Ein Projekt-Bot im Team-Kanal kann als **Kommunikations-Hub** dienen — kein zweiter Claude. Technisches Feedback auf Code holt sich das Teammitglied über Claude im Terminal. Der Bot sorgt dafür, dass keine Kommunikationsartefakte verloren gehen.

**Bot tut automatisch (Beispiele):**
- Montags: Wochenplan posten (aus Aufgaben-Dokument)
- Vor Meetings: Reminder + Blocker-Agenda
- Freitags: Wochen-Summary (erledigte Tasks, Commits)
- Blocker erkennen → an Projektleitung eskalieren

**Bot tut auf Anfrage:**
- Projekt-Docs zitieren ("Was steht in der Architecture zu X?")
- Kontext liefern ("Welche Entscheidungen haben wir zu Y getroffen?")

**Bot tut NICHT:**
- Technisches Code-Feedback geben (das macht Claude)
- Leistung, Geschwindigkeit oder Zuverlässigkeit bewerten
- Eigenständig Architektur-Entscheidungen treffen

### Kurzfassung der Rollenverteilung

| Wer | Rolle |
|-----|-------|
| **Claude** (Terminal / IDE) | Technischer Sparring-Partner: Code schreiben, reviewen, debuggen |
| **Projekt-Bot** (Team-Kanal, optional) | Kommunikations-Hub: Status, Reminders, Docs zitieren, Blocker eskalieren |
| **Projektleitung** | Führung: Architektur-Entscheidungen, Feedback, Bewertung, Richtung |

---

## 7 Prinzipien

1. **Artefakte > Meetings.** Wenn es nicht aufgeschrieben ist, existiert es nicht.
2. **Output > Input.** Wir messen Ergebnisse, nicht Stunden.
3. **Zeigen > Erzählen.** Jedes Meeting beginnt mit einer Demo.
4. **Claude ist Teammitglied.** Mit AI arbeiten ist gewünscht und keine Schwäche.
5. **Markdown = Single Source of Truth.** Kein Notion, kein Jira. Alles im Repo.
6. **Perfekt ist der Feind von fertig.** 80% deployed > 100% nächste Woche.
7. **Kontext > Kontrolle.** Wir dokumentieren für Klarheit, nicht für Überwachung.

---

## Vergleich: Vorher vs. Nachher

| Aspekt | Vorher (Notion + ad hoc) | Nachher (AI-lesbares OS) |
|--------|--------------------------|--------------------------|
| Status-Update | Mündlich im Meeting | Mission-Dokument im Git |
| Aufgaben-Tracking | Notion-Board (überquillt) | Checkboxen in Markdown (im Repo) |
| Meeting-Ergebnisse | Im Kopf / Notion irgendwo | `docs/meetings/YYYY-MM-DD.md` |
| Entscheidungen | "Hatten wir das nicht besprochen?" | Entscheidungs-Log in Mission-Docs |
| AI-Kontext | Claude startet blind | CLAUDE.md → Mission → Architecture → volles Bild |
| Wochenbericht | Manuell erzählen | Git-History + Mission-Dokument = automatisch |
| Blocker | Kommen erst im Meeting raus | Stehen im Dokument, jederzeit sichtbar |

---

## Quick-Start (Tag 1)

### Solo-Projekt

1. `CLAUDE.md` im Repo-Root erstellen (Vorlage: [templates/CLAUDE.md](templates/CLAUDE.md))
2. `docs/product.md` erstellen (Vorlage: [templates/product.md](templates/product.md))
3. `docs/decisions.md` erstellen (Vorlage: [templates/decisions.md](templates/decisions.md))
4. `docs/meetings/` Ordner erstellen (für Kundenmeetings)
5. `docs/modus-operandi.md` — projektspezifische Version dieses Dokuments

### Team-Projekt

1. `CLAUDE.md` im Repo-Root erstellen (Vorlage: [templates/CLAUDE.md](templates/CLAUDE.md))
2. `docs/product.md` erstellen (Vorlage: [templates/product.md](templates/product.md))
3. `docs/decisions.md` erstellen (Vorlage: [templates/decisions.md](templates/decisions.md))
4. `docs/meetings/` Ordner erstellen
5. `docs/team/[name]-mission.md` erstellen (Vorlage: [templates/mission.md](templates/mission.md))
6. `docs/team/modus-operandi.md` — projektspezifische Version dieses Dokuments
7. Dem Teammitglied erklären: "Das ist dein Dokument. Du aktualisierst es. Claude liest es."

**Zeitaufwand pro Tag für Teammitglieder:** ~5-10 Minuten (Status aktualisieren, [x] setzen, Blocker notieren)
**Zeitaufwand pro Woche für Projektleitung:** ~15 Minuten (Meetings + Status scannen)

---

_Grundlage: Dave Blundins "AI-lesbares Betriebssystem" (Moonshots EP #235 + #238), adaptiert für kleine Teams mit Claude._

_EP #238: "Every person in every organization now has to be operating with crystal clear written documents and written plans. Put it on paper so the AI can read it too." — Dave Blundin_
