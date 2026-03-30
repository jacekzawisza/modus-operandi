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
- [ ] **Solo vs. Team** — Bei Solo-Projekten entfallen: Meeting-Abschnitte, Eskalationsregeln, Bot-Integration, Mission-Dokumente

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

---

## Unser Setup: 6 Artefakt-Typen

Inspiriert von Blundins Ansatz, kombiniert mit dem [Vibe Coding Guide](vibe-coding-guide.md) für die technischen Artefakte. Die Team-Ebene ergänzt die Projekt-Ebene — beides zusammen ergibt das AI-lesbare Betriebssystem.

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
**Wo:** `docs/team/meetings/YYYY-MM-DD-thema.md`
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
**Wo:** `docs/team/meetings/transcripts/YYYY-MM-DD-thema.md`
**Wer erstellt:** Wer das Meeting leitet (Aufnahme starten, automatisch transkribieren)
**Tooling:** Deepgram / Whisper oder beliebiges Transkriptions-Tool

**Zweistufiger Workflow:**

```
1. AUFNEHMEN → Transkript erstellen (automatisch)
   Ablage: docs/team/meetings/transcripts/YYYY-MM-DD-thema.md

2. DESTILLIEREN → Meeting-Notiz aus Transkript (AI-Job)
   KI liest Transkript → erstellt strukturierte Notiz
   (Entscheidungen, Action Items, offene Fragen)
   Ablage: docs/team/meetings/YYYY-MM-DD-thema.md
   Das ist das Artefakt das Claude liest und das Team nutzt
```

**Wie destilliert man?** Transkript an Claude geben mit dem Prompt:
```
Lies dieses Meeting-Transkript und erstelle eine strukturierte
Meeting-Notiz nach unserem Template (Teilnehmer, Entscheidungen,
Action Items, Offene Fragen). Dateiname: YYYY-MM-DD-thema.md
```

**Unterschied Intern vs. Extern:**

- **Jour fixe (intern):** Transkript + Notiz ins Repo
- **Arbeitstermin:** Notiz ins Repo, Transkript optional (nur bei Architektur-Entscheidungen)
- **Kunden-/Stakeholder-Meeting:** Transkript + Notiz ins Repo (Kundenwünsche = wichtig)
- **Ad-hoc Calls:** Nur Notiz, nur wenn eine Entscheidung fiel

**Warum beides (Transkript + Notiz)?**
- Die **Notiz** ist das Arbeits-Artefakt: kurz, strukturiert, actionable
- Das **Transkript** ist das Backup: wenn jemand fragt "Was GENAU hat der Kunde gesagt?" → nachschlagen
- AI kann Transkripte durchsuchen → Kontext der in keiner Notiz steht

### 2c. INBOX.md — Brücke zwischen Meetings und Code-Sessions

**Was:** Eine Datei im Repo, die offene Änderungen aus Meetings sammelt, die noch in die Projekt-Docs übernommen werden müssen.
**Wo:** `docs/INBOX.md`
**Wer schreibt rein:** Projektleitung oder Bot (nach Meeting-Destillation)
**Wer arbeitet ab:** Teammitglieder (beim nächsten Session-Abschluss)
**Wer liest mit:** Claude (beim Session-Start)

> Vorlage: [templates/inbox.md](templates/inbox.md)

**Warum?**
Nach Meeting-Destillation fallen Erkenntnisse an, die in andere Docs gehören (neue Entscheidungen → `decisions.md`, neue Aufgaben → Aufgabenplan, Feature-Anforderungen → `PRODUCT.md`). Statt direkt in diese Docs zu schreiben (Merge-Konflikt-Risiko mit laufenden Claude-Sessions), wird alles in `INBOX.md` gesammelt.

**Format:**
```markdown
# INBOX.md — Offene Änderungen aus Meetings

## 2026-03-26 — Jour fixe
- [ ] decisions.md: Feature X ergänzen
- [ ] aufgaben.md: Neue Aufgabe Y
- [ ] PRODUCT.md: Anforderung Z dokumentieren
→ Quelle: docs/team/meetings/2026-03-26-jourfixe.md
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

### 4. PRODUCT.md / PRD (pro Projekt)

**Was:** Das Product Requirements Document — definiert WAS gebaut wird und WARUM, bevor eine Zeile Code entsteht.
**Wo:** `docs/PRODUCT.md`
**Wer erstellt:** Projektleitung, idealerweise vor Projektstart
**Enthält:** Problem, Zielgruppe, Kernfunktionen, Nicht-Ziele, Tech-Stack, Erfolgskriterien, User Journeys

> Vorlage: [templates/product.md](templates/product.md)

**Warum auch im Team?** Ohne PRD baut jeder etwas anderes. Es ist der "Vertrag" zwischen Projektleitung (was sie will) und Umsetzung (was gebaut wird). Claude liest es und versteht den Kontext.

**Aus dem Vibe Coding Guide:** Vor der Umsetzung das PRD von der KI challengen lassen (2-3 Runden). Die KI deckt Lücken auf.

### 5. DECISIONS.md (pro Projekt)

**Was:** Chronologisches Log aller Architektur- und Produktentscheidungen auf Projekt-Level.
**Wo:** `docs/DECISIONS.md`
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

**Unterschied zu Entscheidungen im Mission-Dokument:** Mission-Doc = persönliche/aufgabenbezogene Entscheidungen ("Ich habe X so gelöst"). DECISIONS.md = Projekt-Architektur ("Wir nutzen PostgreSQL weil..."). Claude liest beides.

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
→ Lies docs/team/[name]-mission.md für aktuellen Status.

## Was bauen wir?
→ Lies docs/PRODUCT.md (PRD)

## Tech-Stack + Standards
→ Lies docs/architecture.md

## Architektur-Entscheidungen
→ Lies docs/DECISIONS.md

## Arbeitsweise
→ Lies docs/team/modus-operandi.md

## Coding-Konventionen
- [Projekt-spezifische Regeln hier]
```

**Der Trick:** CLAUDE.md ist kurz (< 200 Zeilen) und verweist auf die anderen Artefakte. So bleibt es wartbar und Claude lädt nur was es braucht. Konventionen und Gotchas gehören direkt rein (damit Claude sie sofort sieht), alles andere wird verlinkt.

---

## Vollständige Dokument-Landschaft

```
dein-projekt/
├── CLAUDE.md                        # AI-Briefing (< 200 Zeilen)
│
├── docs/
│   ├── INBOX.md                     # Offene Änderungen aus Meetings
│   ├── PRODUCT.md                   # PRD — Was und Warum
│   ├── architecture.md              # Stack, Datenmodell, Seitenstruktur
│   ├── decisions.md                 # Architektur-Entscheidungen (chronologisch)
│   ├── roadmap.md                   # Projekt-Phasen mit Status
│   │
│   ├── team/                        # Team-Koordination
│   │   ├── modus-operandi.md        # Dieses Dokument (projektspezifische Version)
│   │   ├── [name]-mission.md        # Mission-Dokument pro Person
│   │   ├── [name]-aufgaben.md       # Detaillierter Aufgabenplan (optional)
│   │   └── meetings/                # Meeting-Notizen
│   │       ├── YYYY-MM-DD-*.md      # Destillierte Notizen
│   │       └── transcripts/         # Vollständige Transkripte
│   │           └── YYYY-MM-DD-*.md
│   │
│   ├── concepts/                    # Feature-Konzepte (vor Implementierung)
│   └── audit/                       # Codebase-Audit-Berichte
```

### Die Logik
- **CLAUDE.md** = AI liest das zuerst → verweist auf alles andere
- **docs/*.md** = Projekt-Artefakte → WAS bauen wir? (aus dem Vibe Coding Guide)
- **docs/team/*.md** = Team-Artefakte → WER macht WAS? (aus dem Modus Operandi)

---

## Wie es zusammenspielt

```
CLAUDE.md (Einstieg)
   ├── docs/architecture.md (WAS bauen wir?)
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
Meeting-Notiz in docs/team/meetings/
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
   → DECISIONS.md aktualisiert (wenn Architektur-Entscheidung)?
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
   (z.B. roadmap.md, architecture.md, decisions.md, PRODUCT.md, Konzepte)
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
- **Dauerhaft** (Entscheidung, Status-Update, Architektur) → **Git** (Mission-Doc, DECISIONS.md)
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
| Meeting-Ergebnisse | Im Kopf / Notion irgendwo | `docs/team/meetings/YYYY-MM-DD.md` |
| Entscheidungen | "Hatten wir das nicht besprochen?" | Entscheidungs-Log in Mission-Docs |
| AI-Kontext | Claude startet blind | CLAUDE.md → Mission → Architecture → volles Bild |
| Wochenbericht | Manuell erzählen | Git-History + Mission-Dokument = automatisch |
| Blocker | Kommen erst im Meeting raus | Stehen im Dokument, jederzeit sichtbar |

---

## Quick-Start (Tag 1)

1. `CLAUDE.md` im Repo-Root erstellen (Vorlage: [templates/claude-md.md](templates/claude-md.md))
2. `docs/team/[name]-mission.md` erstellen (Vorlage: [templates/mission.md](templates/mission.md))
3. `docs/team/meetings/` Ordner erstellen
4. Dem Teammitglied erklären: "Das ist dein Dokument. Du aktualisierst es. Claude liest es."
5. Erste Meeting-Notiz beim nächsten Jour fixe erstellen

**Zeitaufwand pro Tag für Teammitglieder:** ~5-10 Minuten (Status aktualisieren, [x] setzen, Blocker notieren)
**Zeitaufwand pro Woche für Projektleitung:** ~15 Minuten (Meetings + Status scannen)

---

_Grundlage: Dave Blundins "AI-lesbares Betriebssystem" (Moonshots EP #235 + #238), adaptiert für kleine Teams mit Claude._

_EP #238: "Every person in every organization now has to be operating with crystal clear written documents and written plans. Put it on paper so the AI can read it too." — Dave Blundin_
