# Vibe Coding mit Claude — Der Praxis-Guide

*Von Jacek Zawisza | Stand: März 2026*

---

## Über diesen Guide

Dieser Guide richtet sich an Nicht-Entwickler, Gründer und Wissensarbeiter, die mit KI eigene Software bauen wollen — ohne klassisches Informatikstudium, ohne Dev-Team. Er basiert auf umfangreicher Praxiserfahrung aus realen Projekten (von der Idee bis zum deployed SaaS mit Claude Code), ergänzt um Best Practices aus der Vibe-Coding-Community 2025/2026.

Die zentrale Erkenntnis: **Vibe Coding ist eine Demokratisierung von Code.** Mit den richtigen Leitplanken kommt man ins Laufen. 80 % sind schnell erreichbar — aber die letzten 20 % (Bugfixes, Usability, Edge Cases) werden mühsam, wenn man ohne Struktur arbeitet. Dieser Guide gibt dir die Struktur.

---

## Teil 1: Mindset — Was Vibe Coding wirklich ist

### Die neue Rolle: Vom Coder zum Dirigenten

Beim Vibe Coding schreibst du keinen Code Zeile für Zeile. Stattdessen beschreibst du, was du willst, und lässt eine KI den Code generieren. Deine Rolle verschiebt sich: Du wirst zum **Produktmanager deines eigenen Projekts** — du definierst Was und Warum, die KI kümmert sich um das Wie.

Das bedeutet nicht, dass du nichts verstehen musst. Im Gegenteil: Je besser du verstehst, was du willst und wie Software grundsätzlich funktioniert, desto besser wird das Ergebnis.

### Die 80/20-Regel

Der erste Prototyp steht schnell. Eine funktionsfähige App in wenigen Stunden — das ist real. Aber: KI kann nur eine begrenzte Anzahl Schritte vorausdenken und kennt nie den vollständigen Scope deines Projekts. Die verbleibenden 20 % — Edge Cases, Timezone-Bugs, Datenbankmigrationen, Security-Härtung — fressen überproportional viel Zeit. Der Schlüssel liegt in Vorplanung und Dokumentation.

### Wann Vibe Coding passt — und wann nicht

**Gut geeignet:**
- Interne Tools und Prototypen
- MVPs für Validierung einer Geschäftsidee
- Produktivitäts-Apps für den eigenen Bedarf
- Daten-Dashboards und Automatisierungen

**Vorsicht geboten:**
- Sicherheitskritischer Code (Auth, Zahlungen, Verschlüsselung) — immer von jemandem mit Expertise reviewen lassen
- Hochskalierte Systeme mit Millionen Nutzern
- Regulierte Branchen (Medizin, Finanzen) ohne Fach-Review

---

## Teil 2: Setup — Die richtige Arbeitsumgebung

### Tools & Technologien

| Tool | Zweck | Empfehlung |
|------|-------|------------|
| **Claude Code (CLI)** | KI-Coding-Agent | Mächtigste Features, volle Kontrolle |
| **Claude Code (IDE Extension)** | KI in VS Code/JetBrains | Einfache Nutzung, in IDE integriert |
| **Claude Code (Desktop App)** | Parallele Projekte & Agents | Beste UI, ideal für Nicht-CLI-Nutzer |
| **Claude Code (Web App)** | claude.ai/code | Browser-basiert, kein Setup nötig |
| **Cursor / VS Code** | IDE | Für Code-Review und manuelle Edits |
| **Git + GitHub** | Versionskontrolle | Unverzichtbar — jeder Stand muss rückholbar sein |
| **Node.js + npm** | JavaScript-Runtime | Standard-Stack, gut von KI unterstützt |
| **PostgreSQL** | Datenbank | Robust, skalierbar, gute KI-Unterstützung |
| **Tailwind CSS** | Styling | Utility-first, KI generiert es zuverlässig |
| **Hetzner + Coolify** | Hosting | DSGVO-konform, günstig, Self-hosted PaaS |

**Tipp:** Lass den Stack vom LLM vorschlagen. Beschreibe dein Projekt und frage: *"Welchen Tech-Stack empfiehlst du für dieses Projekt? Ich bin kein professioneller Entwickler."* Die KI wird dir einen Stack empfehlen, der gut dokumentiert und leicht handhabbar ist.

### Preismodelle (Claude, Stand März 2026)

- **$17/Monat (Pro):** Zum Einstieg und Ausprobieren
- **$100/Monat (Max):** Für regelmäßige Nutzung — empfohlen für aktive Projekte
- **$200/Monat (Team/API):** Für intensive Nutzung und parallele Agents

> Preise können sich ändern — aktuelle Preise auf [claude.ai](https://claude.ai).

**Token-Sparstrategie:** Token-hungrige Aufgaben (Recherche, lange Dokumente lesen) auf günstigere Modelle verschieben. In Claude Code: `/model` zum Wechseln. Opus für Architekturentscheidungen, Sonnet für Implementierung, Haiku für einfache Aufgaben.

### Technisches Grundwissen (empfohlen, nicht zwingend)

Du musst kein Entwickler sein, aber diese Konzepte zu verstehen hilft enorm:

- **Frontend vs. Backend:** Was der Nutzer sieht vs. was auf dem Server passiert
- **API:** Wie Frontend und Backend miteinander reden
- **Datenbank:** Wo deine Daten gespeichert werden (SQL-Grundlagen)
- **Auth (Authentifizierung):** Wie sich Nutzer anmelden
- **Deployment:** Wie deine App vom Laptop ins Internet kommt
- **Git:** Versionskontrolle — dein Sicherheitsnetz
- **Terminal/CLI:** Grundlegende Befehle (`cd`, `ls`, `npm install`, `git status`)

---

## Teil 3: Der Entwicklungsprozess — Von der Idee zum Produkt

### Phase 1: Idee → Scope definieren

Bevor du auch nur eine Zeile Code generierst: Schreib auf, was du bauen willst.

**Frage dich:**
- Welches Problem löse ich?
- Für wen?
- Was ist der Kern-Workflow (die eine Sache, die es gut können muss)?
- Was ist explizit NICHT im Scope?

### Phase 2: Das Product Requirements Document (PRD)

Das PRD ist das wichtigste Dokument deines Projekts. Es ist dein Vertrag mit der KI.

#### Was gehört rein?

1. **Produktname und Positionierung**
2. **Problem / Motivation** — Warum baust du das?
3. **Zielgruppe** — Wer nutzt es?
4. **Kernfunktionen** — Was sind die 3-5 Must-Have-Features?
5. **Nicht-Ziele** — Was baust du bewusst NICHT?
6. **Tech-Stack** — Welche Technologien werden verwendet?
7. **Erfolgskriterien** — Woran erkennst du, dass es funktioniert?
8. **User Journeys** — Wie sieht ein typischer Nutzungsablauf aus?

#### PRD challengen lassen

**Kritischer Schritt:** Bevor du das PRD der KI zum Umsetzen gibst, lass es erst von der KI challengen.

```
Prompt: "Lies dieses PRD und stelle mir kritische Fragen dazu.
Wo sind Lücken? Was habe ich vergessen? Welche Annahmen
sind riskant? Welche technischen Entscheidungen sollte ich
früh treffen?"
```

Die KI wird Lücken aufdecken, die du übersehen hast. Iteriere 2-3 Runden, bis das PRD wasserdicht ist. Erst dann geht es an die Umsetzung.

**Praxisbeispiel:** Ein PRD für eine Produktivitäts-App definierte klar: "kein Ersatz für Notion" und "kein General-Purpose-AI-Agent". Diese Nicht-Ziele haben über Dutzende Sessions verhindert, dass der Scope unkontrolliert wuchs.

### Phase 3: Architektur & Planung

Erstelle vor dem ersten Code:

1. **ARCHITECTURE.md** — Projektstruktur, Stack-Übersicht, Ordnerstruktur
2. **ROADMAP.md** — Phasen-Plan mit klaren Meilensteinen
3. **CLAUDE.md** — Kontextdokument für die KI (< 200 Zeilen, siehe unten)

#### CLAUDE.md — Das Gedächtnis deines Projekts

Die CLAUDE.md-Datei ist das wichtigste Steuerungsinstrument für KI-Sessions. Sie liegt im Projektwurzel und wird automatisch gelesen. Hier definierst du:

- **Stack und Projektstruktur** — Damit die KI weiß, wo was liegt
- **Coding-Konventionen** — Wie Fehler behandelt werden, wo Constants liegen, welche Patterns gelten
- **Wichtige Entscheidungen** — Warum bestimmte Dinge so sind wie sie sind
- **Fallen und Gotchas** — Bekannte Probleme, die die KI nicht wiederholen soll

**Praxisbeispiel:** Eine CLAUDE.md für eine Node.js/PostgreSQL-App enthält Regeln wie "JSONB-Writes: Immer `$1::jsonb` Cast verwenden" und "DATE-Spalten kommen als Strings, nie `new Date()` darauf anwenden." Ohne solche Regeln baut die KI dieselben Bugs immer wieder ein.

**Goldene Regel:** Unter 200 Zeilen halten. Alles darüber hinaus gehört in spezialisierte Docs (`docs/ARCHITECTURE.md`, `docs/CONVENTIONS.md`).

### Phase 4: Iteratives Bauen — Die Session-Schleife

Jede Coding-Session folgt dem gleichen Muster:

```
┌─────────────────────────────────────────────┐
│  1. KONTEXT LADEN                           │
│     → CLAUDE.md + DECISIONS.md + ROADMAP.md │
│     → Aktuellen Stand verstehen             │
├─────────────────────────────────────────────┤
│  2. AUFGABE DEFINIEREN                      │
│     → Klare, präzise Aufgabenbeschreibung   │
│     → Akzeptanzkriterien festlegen          │
│     → "Nicht nur Hypothese, sondern Spec"   │
├─────────────────────────────────────────────┤
│  3. PLAN ERSTELLEN LASSEN                   │
│     → KI erstellt einen Plan VOR dem Code   │
│     → Du reviewst und gibst Feedback        │
│     → Erst nach Freigabe: Implementierung   │
├─────────────────────────────────────────────┤
│  4. IMPLEMENTIEREN                          │
│     → KI schreibt Code                      │
│     → Du testest und gibst Feedback         │
│     → Iterationsschleife bis es passt       │
├─────────────────────────────────────────────┤
│  5. SESSION ABSCHLIEßEN                     │
│     → Tests laufen lassen                   │
│     → DECISIONS.md aktualisieren            │
│     → ROADMAP.md updaten                    │
│     → Sauberer Commit mit klarer Message    │
│     → Version bumpen                        │
└─────────────────────────────────────────────┘
```

**Warum Planen vor Coden?** Die KI springt gerne direkt in die Implementierung. Das führt zu Code, der das falsche Problem löst. Trenne bewusst: Erst planen (Was bauen wir? Welche Dateien sind betroffen? Welche Risiken gibt es?), dann implementieren.

### Phase 5: Entscheidungen dokumentieren — DECISIONS.md

Jede architektonische oder produktbezogene Entscheidung gehört in ein Entscheidungslog.

#### Bewährtes Format:

```markdown
## YYYY-MM-DD — Titel der Entscheidung (Session N)

**Kontext:** Warum mussten wir entscheiden?

### Was wurde gemacht
1. **Change 1:** Was und warum
2. **Change 2:** Was und warum

### Hinweise
- Besonderheiten, Folgeschritte, bekannte Limitationen
```

#### Warum das unverzichtbar ist:

- **Für dich:** In 3 Monaten weißt du nicht mehr, warum du X statt Y gewählt hast
- **Für die KI:** Sie liest DECISIONS.md am Anfang jeder Session und vermeidet so, bereits getroffene Entscheidungen umzuwerfen
- **Für die Qualität:** Ohne Entscheidungslog baut die KI bei jedem Refactoring potenziell Architektur um, die du bewusst so gewählt hast

**Pro-Tipp:** Archiviere ältere Entscheidungen regelmäßig (z.B. nach 20-30 Sessions) in eine separate Datei (`decisions-archive.md`), damit DECISIONS.md nicht zu lang wird.

#### Architecture Decision Records (ADRs)

Für besonders folgenreiche Entscheidungen lohnt sich ein formelleres Format:

```markdown
# ADR-001: Titel der Entscheidung

**Datum:** YYYY-MM-DD
**Status:** proposed | accepted | superseded | deprecated

## Kontext
Warum mussten wir entscheiden?

## Entscheidung
Was haben wir entschieden?

## Alternativen
Was haben wir verworfen und warum?

## Konsequenzen
- **Positiv:** Was verbessert sich?
- **Negativ:** Was kostet es?
- **Trigger für Revision:** Wann überdenken wir das?
```

### Phase 6: Testen

KI-generierter Code ist **untrusted Code** — behandle ihn so.

- **Lass die KI Tests schreiben:** "Schreibe Unit-Tests für die Funktion X" funktioniert zuverlässig
- **Lauf Tests vor jedem Commit:** `npm test` als feste Gewohnheit
- **Regressions-Testfälle:** Wenn ein Bug auftritt, erstelle einen Testfall dafür, damit er nicht wiederkommt
- **Session-Ende-Checkliste:** Tests grün? DECISIONS.md aktuell? Commit sauber?

**Praxisbeispiel:** Ein reales Projekt wuchs von 0 auf knapp 100 Tests über mehrere Dutzend Sessions. Jeder größere Bug wurde als Testfall verewigt. Die Test-Suite fängt regelmäßig Fehler ab, die die KI bei Refactorings einbaut.

### Phase 7: Saubere Commits

Commit-Messages sind nicht optional — sie sind dein Logbuch.

#### Bewährtes Format:

```
feat: Benutzer-Dashboard mit Statistiken

- Chart-Komponente mit Recharts hinzugefügt
- API-Endpoint für Nutzungsstatistiken erstellt
- Responsive Layout für Mobile angepasst
```

**Konvention:** Conventional Commits (`feat:`, `fix:`, `refactor:`, `docs:`, `test:`, `chore:`). Die KI kann diese Messages automatisch generieren — aber review sie, bevor du committest.

**Wichtig:** Committe nach jedem abgeschlossenen Feature oder Bugfix. Nicht am Ende eines langen Tages alles auf einmal. Kleine, atomare Commits machen Rollbacks möglich.

### Phase 8: Deployment

Dein Code bringt niemandem etwas, wenn er nur auf deinem Laptop läuft.

**Empfohlener Stack für Nicht-Entwickler:**
- **Hetzner Cloud** — EU-hosted, DSGVO-konform, günstig (~13 EUR/Monat für einen brauchbaren Server)
- **Coolify** — Self-hosted PaaS (wie Vercel/Heroku, aber auf deinem eigenen Server)
- **Docker** — Containerisierung für reproduzierbare Deployments
- **Git-Push-Deploy** — Push auf main → automatisches Deployment

**Praxisbeispiel:** Eine typische SaaS-App läuft auf einem Hetzner CX22 oder CX32 mit Coolify. Ein `git push` deployed automatisch. SSL-Zertifikate werden automatisch per Let's Encrypt erstellt. Kosten: ab ~8-13 EUR/Monat für alles inklusive Backups.

---

## Teil 4: Best Practices — Aus der Praxis gelernt

### Do's

1. **Anforderungen präzise formulieren.** Eine bloße Hypothese reicht nicht — Aufgaben müssen ausformuliert sein, mit klaren Akzeptanzkriterien.

2. **Immer einen Plan machen lassen.** Bevor die KI coden darf, soll sie erklären, was sie vorhat und welche Dateien betroffen sind.

3. **Entscheidungen sofort dokumentieren.** Jede Session endet mit einem Update von DECISIONS.md. Keine Ausnahmen.

4. **CLAUDE.md pflegen.** Wenn du eine Konvention etablierst oder einen Bug findest, der auf einem Missverständnis beruht: In die CLAUDE.md eintragen, damit die KI es beim nächsten Mal richtig macht.

5. **Modell bewusst wählen.** Token-hungrige Aufgaben (Recherche, lange Kontexte) auf günstigere Modelle. Architekturentscheidungen und komplexe Refactorings auf das stärkste Modell.

6. **Regelmäßig Codebase-Audits machen.** Alle 5-10 Sessions: Lass die KI den gesamten Code reviewen. Sie findet fehlende Error-Handling, hardcodierte Strings, Memory Leaks und tote Referenzen.

7. **Konzepte vor Features schreiben.** Für komplexere Features: Erst ein Konzeptdokument (`docs/concepts/feature-name.md`), dann Implementierung. Das spart Iterationen.

8. **Niemals API-Keys oder Tokens im Chat teilen.** Nutze `.env`-Dateien und Environment Variables.

### Don'ts

1. **Nicht ohne PRD starten.** Kein PRD = kein klarer Scope = Feature Creep = Frustration.

2. **Nicht ohne Tests deployen.** KI-generierter Code enthält in 45 % der Fälle Sicherheitslücken (OWASP Top 10). Tests und Reviews sind Pflicht.

3. **Nicht blind akzeptieren.** Die KI macht Fehler. Besonders bei Datums-/Timezone-Logik, Datenbankmigrationen und Auth-Code. Verstehe, was sie baut.

4. **Nicht alles auf einmal bauen.** Phasenweise vorgehen. Ein Feature pro Session. Testen. Committen. Nächstes Feature.

5. **Nicht die Dokumentation vernachlässigen.** Die KI vergisst alles zwischen Sessions. Deine Docs sind ihr Gedächtnis.

6. **Kein "AI Slop" akkumulieren lassen.** Mit der Zeit baut die KI redundanten, unnötig komplexen Code ein. Regelmäßig aufräumen und refactoren.

---

## Teil 5: Die häufigsten Fallen — und wie du sie vermeidest

### Falle 1: Datumsprobleme / Timezone-Bugs

**Problem:** Unterschiedliche Zeitzonen zwischen Server (UTC) und Nutzer (CET) führen zu Bugs rund um Mitternacht. Deadlines erscheinen einen Tag zu früh als überfällig.

**Lösung:** Eigene Date-Helper-Funktionen schreiben lassen, die immer mit lokaler Zeitzone arbeiten. In der CLAUDE.md dokumentieren: "Nie `new Date().toISOString().split('T')[0]` für 'heute' verwenden."

### Falle 2: Fehlende Vorplanung

**Problem:** Features ohne Plan implementieren → mühsames Bugfixing im Nachhinein. Die KI löst das unmittelbare Problem, erzeugt aber neue Probleme an anderer Stelle.

**Lösung:** Immer erst planen lassen. "Erstelle einen Implementierungsplan für Feature X. Welche Dateien sind betroffen? Welche Risiken gibt es?"

### Falle 3: Datenbankwechsel / Architektur-Umbrüche

**Problem:** Wechsel der Datenbank oder des Daten-Backends (z.B. von einer NoSQL-API zu PostgreSQL) bedeutet, dass alle Views, alle Queries, alle Datenstrukturen angepasst werden müssen. Das ist enorm aufwendig.

**Lösung:** Stack-Entscheidungen früh und bewusst treffen. Im PRD festlegen. Wenn ein Wechsel nötig wird: Migrationsplan erstellen, schrittweise vorgehen, nie Big-Bang-Migration.

### Falle 4: AI Slop / Schleichende Code-Degradation

**Problem:** Mit der Zeit wird immer mehr redundanter, inkonsistenter Code eingebaut. Die KI kennt nicht den vollständigen Scope und erzeugt Duplikate, hardcodierte Strings, fehlende Validierungen.

**Lösung:** Regelmäßige Codebase-Audits (automatisiert oder manuell). Konstanten-Dateien pflegen. In der CLAUDE.md: "Nie hardcodierte Status-Strings, immer Constants aus `constants/statuses.js`."

### Falle 5: Security vernachlässigen

**Problem:** 45 % des KI-generierten Codes enthält OWASP-Top-10-Schwachstellen. Hardcodierte Secrets, fehlende Input-Validierung, SQL Injection.

**Lösung:**
- Input-Validierung auf ALLEN Endpoints
- Parameterisierte SQL-Queries (nie String-Interpolation)
- UUID-Validierung auf allen ID-Parametern
- Security-Scanner einsetzen (Snyk, Semgrep)
- Auth-Code immer reviewen
- Security-Scans in den Workflow integrieren: vor jedem Deployment mindestens einmal `npx snyk test` oder `semgrep --config auto` laufen lassen

### Falle 6: Docker-Einschränkungen

**Problem:** Docker kann die Entwicklung verkomplizieren statt vereinfachen. Zu restriktive Container-Konfigurationen verhindern Debugging. Image-Builds dauern bei großen Projekten lange. ENV-Variablen werden falsch injiziert.

**Lösung:** Docker erst für Deployment einsetzen, nicht für die lokale Entwicklung. Lokal direkt mit `npm run dev` arbeiten. Multi-Stage-Builds nutzen (Build-Stage + schlanke Runtime-Stage). Docker-Compose nur für Production, nicht für Development.

### Falle 7: Headless-Betrieb und Hardware-Macken

**Problem:** Wenn du einen dedizierten Server (z.B. Mac Mini) für KI-Agents oder Automatisierungen nutzt, braucht macOS ein angeschlossenes Display. Ohne Display funktionieren manche Services nicht korrekt.

**Lösung:** HDMI-Dummy-Stecker kaufen (< 10 EUR), der dem System einen Monitor vortäuscht. Sleep-Mode deaktivieren. Services als LaunchAgents konfigurieren, die beim Systemstart automatisch starten.

---

## Teil 6: Specification Engineering — Der PRD-Prozess im Detail

### Was ist Specification Engineering?

Der wichtigste Shift im Vibe Coding 2025/2026: **Specification Engineering statt Prompt Engineering.** Statt einzelne Prompts zu optimieren, investierst du die Hauptarbeit in strukturierte, eindeutige Projekt-Spezifikationen. Je besser dein PRD und deine Dokumentation, desto weniger musst du bei der Implementierung nachsteuern.

### Der Spec-First-Workflow

```
1. IDEE → 2. PRD SCHREIBEN → 3. KI CHALLENGED PRD
     ↓                              ↓
4. PRD ITERIEREN (2-3 Runden) → 5. FEATURE-SPECS ABLEITEN
     ↓                              ↓
6. IMPLEMENTATION PLAN → 7. CODE GENERIEREN → 8. TESTEN
```

### Wie eine gute Spezifikation aussieht

Schlechte Spec: *"Baue eine Login-Seite"*

Gute Spec:
```
Feature: User Authentication
- E-Mail/Passwort-Login mit JWT-Token
- Token-Refresh nach 7 Tagen
- Rate Limiting: max 5 Login-Versuche pro Minute
- Frontend: Login-Formular mit Validierung, Error-Messages
- Registrierung nur per Invite-Code (kein öffentliches Signup)
- Passwort-Anforderungen: min. 8 Zeichen
- Nach Login: Redirect auf Dashboard
- Akzeptanzkriterien:
  - [ ] Login mit gültigen Credentials → JWT-Token
  - [ ] Login mit falschen Credentials → Fehlermeldung
  - [ ] Rate Limiting greift nach 5 Versuchen
  - [ ] Invite-Code wird bei Registration geprüft
```

Die KI interpretiert strukturierte, modulare Spezifikationen deutlich besser als Fließtext. Klare Akzeptanzkriterien als Checkliste machen es der KI leicht, vollständige Implementierungen zu liefern.

---

## Teil 7: Die Dokumenten-Landschaft — Was du pflegen solltest

### Übersicht der empfohlenen Projektdokumente

```
dein-projekt/
├── CLAUDE.md              # KI-Kontext (< 200 Zeilen)
├── docs/
│   ├── PRODUCT.md          # PRD — Was bauen wir und warum?
│   ├── ARCHITECTURE.md     # Stack, Struktur, Ordneraufbau
│   ├── ROADMAP.md          # Phasen-Plan mit Status
│   ├── DECISIONS.md        # Entscheidungslog (chronologisch)
│   ├── DESIGN_SYSTEM.md    # Visuelle Richtlinien
│   ├── TESTING.md          # Teststrategie
│   ├── adr/                # Architecture Decision Records
│   ├── concepts/           # Feature-Konzepte
│   ├── plans/              # Implementierungspläne
│   ├── audit/              # Codebase-Audit-Berichte
│   └── team/               # Team-Koordination (siehe Teil 8)
│       ├── modus-operandi.md  # Wie wir zusammenarbeiten
│       ├── [name]-mission.md  # Mission pro Person
│       └── meetings/          # Meeting-Notizen
├── .env                    # Environment Variables (gitignored!)
└── ...
```

> **Solo-Projekt?** Den `team/`-Ordner weglassen. **Team-Projekt?** Siehe Teil 8 für das Setup.

### Wann welches Dokument?

| Dokument | Wann erstellen? | Wann aktualisieren? |
|----------|----------------|---------------------|
| PRODUCT.md | Vor dem ersten Code | Bei Scope-Änderungen |
| ARCHITECTURE.md | Nach Stack-Entscheidung | Bei neuen Modulen/Services |
| ROADMAP.md | Vor dem ersten Code | Nach jeder Session |
| DECISIONS.md | Ab Session 1 | Nach jeder Session |
| CLAUDE.md | Vor dem ersten Code | Wenn neue Konventionen entstehen |
| Konzepte | Vor komplexen Features | Einmalig (dann Implementierung) |
| ADRs | Bei folgenreichen Entscheidungen | Selten (superseded/deprecated) |
| Mission-Docs | Bei Team-Projekten: Tag 1 | Täglich (durch Mitarbeiter) |
| Meeting-Notizen | Nach jedem Meeting | Einmalig (5 Min danach) |
| Modus Operandi | Bei Team-Projekten: Tag 1 | Bei Prozess-Änderungen |

---

## Teil 8: Vibe Coding im Team — Vom Solo-Projekt zur Teamarbeit

### Das Problem: Solo-Workflow skaliert nicht

Alles bis hierher funktioniert perfekt, wenn DU alleine mit Claude baust. Aber sobald ein zweiter Mensch dazukommt, reicht das nicht mehr:
- Wer macht was gerade?
- Woher weiß Claude, welchen Kontext Person B braucht?
- Wie vermeidet man, dass zwei Leute dieselbe Architektur-Entscheidung unterschiedlich treffen?

### Die Lösung: AI-lesbares Betriebssystem

Inspiriert von Dave Blundin (Link Ventures, Moonshots-Podcast EP #235): **Arbeit wird absichtlich so dokumentiert, dass sowohl Menschen als auch AI daraus Kontext ableiten können.** Das ist kein Tracking — es ist Klarheit.

### Was sich ändert: 2 zusätzliche Artefakt-Typen

Zu den Projekt-Dokumenten (CLAUDE.md, PRODUCT.md, ARCHITECTURE.md, DECISIONS.md, ROADMAP.md) kommen:

#### Mission-Dokument (pro Person)

Jedes Teammitglied bekommt einen Einseiter in `docs/team/[name]-mission.md`:

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

**Warum?**
- Claude liest es automatisch → weiß was die Person gerade macht
- Projektleitung scannt Status in 2 Minuten
- Blocker-Liste = Meeting-Agenda → keine Vorbereitung nötig
- Git-History zeigt, wann Status aktualisiert wurde

#### Meeting-Notiz (pro Meeting)

```markdown
# Meeting: [Thema] | [Datum]

## Entscheidungen
- [Entscheidung] — Begründung — Verantwortlich — Frist

## Action Items
- [ ] [Was] — [Wer] — [Bis wann]
```

**Regel:** Kein Meeting ohne Ergebnis-Dokument. 5 Minuten danach, nicht mehr.

### CLAUDE.md im Team-Kontext

Im Solo-Projekt verweist CLAUDE.md auf deine Docs. Im Team verweist es zusätzlich auf die Mission-Dokumente:

```markdown
# CLAUDE.md

## Team
→ Lies docs/team/[name]-mission.md für aktuellen Status.

## Was bauen wir?
→ Lies docs/PRODUCT.md

## Architektur
→ Lies docs/architecture.md
```

So weiß Claude bei jedem Start, wer was macht, und baut die richtige Sache für die richtige Person.

### Team-Prinzipien

1. **Artefakte > Meetings.** Wenn es nicht aufgeschrieben ist, existiert es nicht.
2. **Output > Input.** Ergebnisse messen, nicht Stunden.
3. **Zeigen > Erzählen.** Jedes Review beginnt mit einer Demo.
4. **Claude ist Teammitglied.** AI nutzen ist gewünscht, keine Schwäche.
5. **Kontext > Kontrolle.** Dokumentation für Klarheit, nicht Überwachung.

### Weiterführend

Für ein vollständiges Team-Setup mit Meeting-Rhythmus, Bewertungskriterien, Eskalationsregeln und Wochen-Workflow: Siehe das **[Modus Operandi](modus-operandi.md)**.

### Hinweis: EU AI Act

Dieses System ist Arbeitsdokumentation zur Koordination — **kein** Mitarbeitertracking. Keine automatische Überwachung von Arbeitszeiten, keine AI-basierte Leistungsbewertung, keine Emotionserkennung (seit Feb 2025 verboten). Status-Updates sind freiwillige, selbst-dokumentierte Artefakte.

---

## Teil 9: Fortgeschrittene Techniken

### Automatisierte Nacht-Audits

Sobald dein Projekt wächst (> 30 Dateien), lohnen sich automatisierte Codebase-Audits. Du kannst die KI beauftragen:

```
Prompt: "Führe ein vollständiges Codebase-Audit durch.
Prüfe auf: fehlende Error-Handling, hardcodierte Strings,
Memory Leaks, tote Referenzen, fehlende Input-Validierung,
inkonsistente Patterns. Erstelle einen Audit-Bericht."
```

In größeren Projekten laufen solche Audits regelmäßig — idealerweise mit parallelen Agents für verschiedene Bereiche (z.B. Backend-Routes, Shared Libraries, Frontend-Komponenten, Docs). Die Ergebnisse werden in `docs/audit/` gespeichert.

### RAG (Retrieval-Augmented Generation) für Projektkontext

Bei größeren Projekten lohnt sich ein Vektor-basiertes Gedächtnis, das der KI bei Fragen über den gesamten Projektkontext Auskunft geben kann. Damit kann die KI z.B. in alten Entscheidungen, Konzepten und Notizen suchen, ohne dass du sie manuell bereitstellen musst. Gängige Technologien dafür: PostgreSQL + pgvector oder dedizierte Vektor-Datenbanken wie Pinecone.

### Session-Pläne

Für längere Projekte: Erstelle einen übergreifenden Session-Plan (`SESSION_PLAN.md`), der die nächsten 5-10 Sessions mit konkreten Aufgaben priorisiert. Das gibt Struktur und verhindert, dass du von Session zu Session planlos arbeitest.

### Skills und Automatisierung

Claude Code unterstützt wiederverwendbare "Skills" — vorgefertigte Workflows für häufige Aufgaben (Commits, Tests, Deployments). Erstelle eigene Skills für wiederkehrende Aufgaben in deinem Projekt. Der eingebaute Skill-Creator hilft dir, neue Skills zu definieren, zu testen und zu optimieren.

---

## Teil 10: Der typische Projektlebenszyklus

### Woche 1-2: Foundation

1. Idee dokumentieren und PRD schreiben
2. PRD von der KI challengen lassen (2-3 Runden)
3. Tech-Stack festlegen
4. CLAUDE.md, ARCHITECTURE.md, ROADMAP.md erstellen
5. Scaffolding (Projektstruktur anlegen lassen)
6. Erste Kernfunktion implementieren und deployen

### Woche 3-6: Kernfunktionen

7. Feature für Feature implementieren (eine Session = ein Feature)
8. Nach jedem Feature: Tests, Commit, Docs-Update
9. DECISIONS.md wächst organisch
10. Erstes Codebase-Audit nach ~10 Sessions

### Woche 7-12: Polish & Härtung

11. Codebase-Audits alle 5 Sessions
12. Security-Review (Input-Validierung, Auth-Härtung)
13. Performance-Optimierung
14. Deployment-Pipeline stabilisieren
15. Backup-Strategie implementieren

### Fortlaufend: Wartung & Weiterentwicklung

16. Regelmäßige Audits
17. Entscheidungen dokumentieren
18. AI Slop aufräumen
19. Test-Suite erweitern
20. CLAUDE.md aktuell halten

---

## Teil 11: Checklisten

### Checkliste: Projekt starten

- [ ] Problem und Zielgruppe definiert
- [ ] PRD geschrieben und von KI challenged
- [ ] Tech-Stack festgelegt
- [ ] CLAUDE.md erstellt
- [ ] ARCHITECTURE.md erstellt
- [ ] ROADMAP.md mit Phasen erstellt
- [ ] Git-Repository initialisiert
- [ ] .env-Datei in .gitignore
- [ ] Erste Kernfunktion implementiert und getestet
- [ ] Erster Commit mit sauberer Message

### Checkliste: Session beenden

- [ ] Alle Tests grün (`npm test`)
- [ ] DECISIONS.md aktualisiert
- [ ] ROADMAP.md Status aktualisiert
- [ ] Ggf. CLAUDE.md um neue Konventionen ergänzt
- [ ] Sauberer Commit (Conventional Commits Format)
- [ ] Version gebumpt (bei Feature-Releases)

### Checkliste: Vor dem Deployment

- [ ] Alle Tests grün
- [ ] Security-Basics geprüft (Input-Validierung, parameterisierte Queries)
- [ ] Keine API-Keys im Code
- [ ] Environment Variables konfiguriert
- [ ] Backup-Strategie vorhanden
- [ ] SSL/HTTPS aktiviert
- [ ] Error-Tracking eingerichtet (z.B. Sentry)

---

## Teil 12: Glossar

| Begriff | Erklärung |
|---------|-----------|
| **Vibe Coding** | Softwareentwicklung durch Beschreibung statt manuellem Code-Schreiben, mit KI als Implementierer |
| **PRD** | Product Requirements Document — beschreibt Was und Warum eines Produkts |
| **CLAUDE.md** | Projektkontext-Datei, die Claude automatisch liest |
| **ADR** | Architecture Decision Record — formelle Dokumentation einer Architekturentscheidung |
| **AI Slop** | Redundanter, unnötig komplexer Code, der sich durch wiederholte KI-Generierung ansammelt |
| **Conventional Commits** | Commit-Message-Standard (`feat:`, `fix:`, `refactor:` etc.) |
| **RAG** | Retrieval-Augmented Generation — KI-Antworten ergänzt durch Vektorsuche in eigenen Daten |
| **Scaffolding** | Grundstruktur eines Projekts (Ordner, Config-Dateien, Dependencies) |
| **Edge Case** | Sonderfall, den man beim Normalfall-Design leicht übersieht |
| **Refactoring** | Code umstrukturieren ohne Funktionsänderung — für bessere Wartbarkeit |
| **Mission-Dokument** | Ein-Seiter pro Teammitglied mit Auftrag, Status, Wochenplan, Blockern — wird von AI und Menschen gleichermaßen gelesen |
| **Modus Operandi** | Dokumentiertes Operating Model: Wie arbeitet das Team zusammen? Meeting-Rhythmus, Bewertung, Eskalation |
| **MVP** | Minimum Viable Product — kleinstmögliche Version, die echten Nutzen bietet |
| **PaaS** | Platform as a Service — Hosting-Plattform, die Deployment vereinfacht |
| **pgvector** | PostgreSQL-Extension für Vektorsuche (Basis für RAG-Systeme) |

---

## Ressourcen & Weiterführendes

- [Claude Code Dokumentation](https://docs.anthropic.com/en/docs/claude-code)
- [Claude Code Best Practices (offiziell)](https://code.claude.com/docs/en/best-practices)
- [Vibe Coding Complete Guide 2026](https://vibecoding.app/blog/vibe-coding-complete-guide)
- [Best Practices for Using PRDs with Claude Code](https://www.chatprd.ai/learn/PRD-for-Claude-Code)
- [Vibe Coding Guide 2026 — SitePoint](https://www.sitepoint.com/vibe-coding-2026-complete-guide/)
- [The State of Vibe Coding: A 2026 Strategic Blueprint](https://www.keywordsstudios.com/en/about-us/news-events/news/the-state-of-vibe-coding-a-2026-strategic-blueprint/)
- [AI Technical Debt: How Vibe Coding Increases TCO](https://www.baytechconsulting.com/blog/ai-technical-debt-how-vibe-coding-increases-tco-and-how-to-fix-it)

---

*Dieser Guide basiert auf realer Projekterfahrung (von der Idee bis zum deployed SaaS) und aktuellen Community Best Practices. Er wird fortlaufend aktualisiert.*

*Jacek Zawisza — prof-z.com*
