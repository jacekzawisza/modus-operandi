# Building with AI — Praxis-Guide für Solo-Builder und Teams

*Von Jacek Zawisza | Stand: März 2026*

---

## Über diesen Guide

Dieser Guide ist die **Praxis-Schicht** des [Modus Operandi](modus-operandi.md). Während Modus Operandi das *Operating Model* beschreibt (welche Artefakte, welcher Rhythmus, welche Disziplin), beschreibt dieser Guide die *konkrete Bau-Arbeit*: Wie du als Einzelperson oder im Kleinteam mit Claude Software baust — vom PRD über die Session-Schleife bis zum Deployment.

Zielpublikum: Solo-Builder, Gründer, Wissensarbeiter und kleine Teams, die mit KI eigene Software bauen — ohne klassisches Informatikstudium, ohne Dev-Team. Basis: umfangreiche Praxiserfahrung aus realen Projekten (von der Idee bis zum deployed SaaS mit Claude Code), ergänzt um Best Practices aus der Community 2025/2026.

### Begriffe: Vibe Coding, Agentic Coding, Building with AI

Drei Begriffe, die dir in der Community begegnen:

- **Vibe Coding** (Karpathy, Feb 2025): Schnelles, explorierendes Bauen mit KI — gut für Prototypen, MVPs, Wegwerf-Code. Karpathy hat später klargestellt: Vibe Coding ist *nicht* dasselbe wie professionelle Software-Entwicklung mit AI-Unterstützung.
- **Agentic Coding** (Anthropic/Cursor-Sprachraum, 2025/2026): Bauen mit AI-Agenten, die mehr Schritte autonom ausführen — strukturierter als Vibe Coding, mit klaren Spec/Plan/Execute-Phasen.
- **Building with AI** (dieser Guide): Neutraler Sammelbegriff. Umfasst beide Stilrichtungen und legt den Fokus auf das, was sich nicht ändert — Disziplin, Artefakte, klare Specs.

Du wirst hier Patterns aus beiden Welten finden: schnell starten wie Vibe Coding, sauber dokumentieren wie Agentic Engineering.

Die zentrale Erkenntnis: **AI-natives Bauen ist eine Demokratisierung von Code.** Mit den richtigen Leitplanken kommt man ins Laufen. 80 % sind schnell erreichbar — aber die letzten 20 % (Bugfixes, Usability, Edge Cases) werden mühsam, wenn man ohne Struktur arbeitet. Dieser Guide gibt dir die Struktur.

---

## Teil 1: Mindset — Vom Coder zum Dirigenten

### Die neue Rolle

Beim AI-nativen Bauen schreibst du keinen Code Zeile für Zeile. Stattdessen beschreibst du, was du willst, und lässt eine KI den Code generieren. Deine Rolle verschiebt sich: Du wirst zum **Produktmanager deines eigenen Projekts** — du definierst Was und Warum, die KI kümmert sich um das Wie.

Das bedeutet nicht, dass du nichts verstehen musst. Im Gegenteil: Je besser du verstehst, was du willst und wie Software grundsätzlich funktioniert, desto besser wird das Ergebnis.

### Die 80/20-Regel

Der erste Prototyp steht schnell. Eine funktionsfähige App in wenigen Stunden — das ist real. Aber: KI kann nur eine begrenzte Anzahl Schritte vorausdenken und kennt nie den vollständigen Scope deines Projekts. Die verbleibenden 20 % — Edge Cases, Timezone-Bugs, Datenbankmigrationen, Security-Härtung — fressen überproportional viel Zeit. Der Schlüssel liegt in Vorplanung und Dokumentation.

### Wann AI-natives Bauen passt — und wann nicht

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

Das PRD (Datei: `docs/prd.md`) ist das wichtigste Dokument deines Projekts. Es ist dein Vertrag mit der KI.

#### Was gehört rein?

1. **Produktname und Positionierung**
2. **Problem / Motivation** — Warum baust du das?
3. **Zielgruppe** — Wer nutzt es?
4. **Produktvision + Nicht-Ziele** — Was bauen wir, was bewusst NICHT?
5. **Tech-Stack** (Kurzübersicht — Details in `architecture.md`)
6. **Roadmap als Phasen-Narrative** — was lösen wir wann (keine konkreten Feature-Listen, die kommen in `backlog.md`)
7. **Erfolgskriterien** — Woran erkennst du, dass es funktioniert?
8. **Risiken + offene Fragen**

> Vollständige Template-Struktur: [templates/prd.md](templates/prd.md). Warum keine Feature-Listen im PRD: [Modus Operandi §6](modus-operandi.md#6-prdmd--product-requirements-document-pro-projekt).

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

1. **architecture.md** — Projektstruktur, Stack-Übersicht, Ordnerstruktur
2. **CLAUDE.md** — Kontextdokument für die KI (< 200 Zeilen)

Was im Operating Model in jedes Artefakt gehört (Mission, Architecture, decisions etc.) und wann es aktualisiert wird, steht in [Modus Operandi §Unser Setup](modus-operandi.md#unser-setup-6-artefakt-typen) und [§Projekt-Lebenszyklus](modus-operandi.md#projekt-lebenszyklus-wie-artefakte-zusammenarbeiten). Hier nur die Bau-Praxis pro Datei.

#### CLAUDE.md in der Praxis

Die CLAUDE.md ist das Steuerungsinstrument pro Session. Was *im Sinne der Bau-Praxis* hier rein gehört (über die strukturellen Verweise hinaus):

- **Coding-Konventionen** — Wie Fehler behandelt werden, wo Constants liegen, welche Patterns gelten
- **Fallen und Gotchas** — Bekannte Probleme, die die KI nicht wiederholen soll

**Praxisbeispiel:** Eine CLAUDE.md für eine Node.js/PostgreSQL-App enthält Regeln wie "JSONB-Writes: Immer `$1::jsonb` Cast verwenden" und "DATE-Spalten kommen als Strings, nie `new Date()` darauf anwenden." Ohne solche Regeln baut die KI dieselben Bugs immer wieder ein.

**Goldene Regel:** Unter 200 Zeilen halten. Alles darüber hinaus gehört in spezialisierte Docs (`docs/architecture.md`, `docs/CONVENTIONS.md`).

### Phase 4: Iteratives Bauen — Die Session-Schleife

Jede Coding-Session folgt dem gleichen 5-Schritt-Muster: Kontext laden → Aufgabe definieren → Plan erstellen lassen → Implementieren → Session abschließen.

**Warum Planen vor Coden?** Die KI springt gerne direkt in die Implementierung. Das führt zu Code, der das falsche Problem löst. Trenne bewusst: Erst planen (Was bauen wir? Welche Dateien sind betroffen? Welche Risiken gibt es?), dann implementieren.

> Vollständige Schritt-für-Schritt-Erklärung inkl. empfohlener Slash-Commands (`/session-start`, `/session-end`, `/commitpush`): [Modus Operandi §Session-Workflow](modus-operandi.md#session-workflow-aus-dem-builder-guide).

### Phase 5: Entscheidungen dokumentieren — decisions.md

Jede architektonische oder produktbezogene Entscheidung gehört in ein Entscheidungslog (`docs/decisions.md`). Ohne dieses Log baut die KI bei jedem Refactoring potenziell Architektur um, die du bewusst so gewählt hast — und du weißt in drei Monaten nicht mehr warum.

> Format, Beispiele und das Verhältnis zu Mission-Doc-Entscheidungen: [Modus Operandi §9 decisions.md](modus-operandi.md#9-decisionsmd-pro-projekt).

**Pro-Tipp:** Archiviere ältere Entscheidungen regelmäßig (z.B. nach 20-30 Sessions) in eine separate Datei (`decisions-archive.md`), damit decisions.md nicht zu lang wird.

#### Architecture Decision Records (ADRs) — die schwergewichtige Variante

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
- **Session-Ende-Checkliste:** Tests grün? decisions.md aktuell? Commit sauber?

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

1. **Karpathys 4 Prinzipien als Default.** Think Before Coding, Simplicity First, Surgical Changes, Goal-Driven Execution. Siehe Teil 5 für Details. Diese Regeln gehören in jede CLAUDE.md (das Template enthält sie bereits).

2. **Entscheidungen sofort dokumentieren.** Jede Session endet mit einem Update von decisions.md. Keine Ausnahmen.

3. **CLAUDE.md pflegen.** Wenn du eine Konvention etablierst oder einen Bug findest, der auf einem Missverständnis beruht: In die CLAUDE.md eintragen, damit die KI es beim nächsten Mal richtig macht.

4. **Modell bewusst wählen.** Token-hungrige Aufgaben (Recherche, lange Kontexte) auf günstigere Modelle. Architekturentscheidungen und komplexe Refactorings auf das stärkste Modell.

5. **Regelmäßig Codebase-Audits machen.** Alle 5-10 Sessions: Lass die KI den gesamten Code reviewen. Sie findet fehlende Error-Handling, hardcodierte Strings, Memory Leaks und tote Referenzen. (Audit ist explizit beauftragtes Refactoring — kollidiert nicht mit "Surgical Changes" aus Karpathy 3.)

6. **Konzepte vor Features schreiben.** Für komplexere Features: Erst ein Konzeptdokument (`docs/concepts/feature-name.md`), dann Implementierung. Das spart Iterationen.

7. **Niemals API-Keys oder Tokens im Chat teilen.** Nutze `.env`-Dateien und Environment Variables.

### Don'ts

1. **Nicht ohne PRD starten.** Kein PRD = kein klarer Scope = Feature Creep = Frustration.

2. **Nicht ohne Tests deployen.** KI-generierter Code enthält in 45 % der Fälle Sicherheitslücken (OWASP Top 10). Tests und Reviews sind Pflicht.

3. **Nicht blind akzeptieren.** Die KI macht Fehler. Besonders bei Datums-/Timezone-Logik, Datenbankmigrationen und Auth-Code. Verstehe, was sie baut.

4. **Nicht alles auf einmal bauen.** Phasenweise vorgehen. Ein Feature pro Session. Testen. Committen. Nächstes Feature.

5. **Nicht die Dokumentation vernachlässigen.** Die KI vergisst alles zwischen Sessions. Deine Docs sind ihr Gedächtnis.

6. **Kein "AI Slop" akkumulieren lassen.** Mit der Zeit baut die KI redundanten, unnötig komplexen Code ein. Regelmäßig aufräumen und refactoren.

---

## Teil 5: Die 4 Coding-Prinzipien — Regeln für die KI selbst

Während Teil 4 dein Verhalten als Vibe Coder beschreibt, definiert dieser Teil **die Regeln, nach denen die KI arbeiten soll**. Sie gehören in die `CLAUDE.md` jedes Projekts und in deine globale `~/.claude/CLAUDE.md` — damit sie bei jeder Session automatisch greifen.

Quelle: Andrej Karpathy hat in einem [vielzitierten Post](https://x.com/karpathy/status/2015883857489522876) die typischen Schwächen von LLMs beim Coden beschrieben. Forrest Chang hat daraus vier Prinzipien destilliert ([forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills)). Diese Version ist leicht für deutschsprachige Solo-/Kleinteam-Projekte adaptiert.

### Das Problem, das die Prinzipien lösen

Karpathys Beobachtungen über LLM-Coding-Verhalten:

- *"The models make wrong assumptions on your behalf and just run along with them without checking. They don't manage their confusion, don't seek clarifications, don't surface inconsistencies, don't present tradeoffs, don't push back when they should."*
- *"They really like to overcomplicate code and APIs, bloat abstractions, don't clean up dead code... implement a bloated construction over 1000 lines when 100 would do."*
- *"They still sometimes change/remove comments and code they don't sufficiently understand as side effects, even if orthogonal to the task."*

### Die 4 Prinzipien

**1. Think Before Coding** — Annahmen explizit machen, nicht still wählen

LLMs picken oft eine Interpretation und laufen damit los. Stattdessen:
- Bei Mehrdeutigkeit Interpretationen aufzeigen statt zu raten
- Bei Unklarheit stoppen und fragen, nicht weiterlaufen
- Wenn ein einfacherer Ansatz existiert: sagen
- Trade-offs benennen, nicht still entscheiden

**2. Simplicity First** — Minimum Code, der das Problem löst

Gegen den Hang zur Überengineerung:
- Keine Features über das Gefragte hinaus
- Keine Abstraktionen für Single-Use-Code
- Keine "Flexibility" oder "Configurability", die nicht angefordert wurde
- Kein Error-Handling für unmögliche Szenarien
- Wenn 200 Zeilen auch in 50 gehen: 50 schreiben

**Test:** Würde ein Senior Engineer sagen, das ist überkompliziert? Wenn ja: vereinfachen.

**3. Surgical Changes** — Nur das anfassen, was nötig ist

Beim Bearbeiten existierenden Codes:
- Kein Drive-by-Refactoring von Architektur, das nicht angefordert wurde
- Existierenden Stil matchen, auch wenn ich's anders machen würde
- Bei dead code: erwähnen, nicht ungefragt löschen

**Erlaubt im Vorbeigehen** (Adaption für unsere Projekte):
- Kleine Style-Angleichungen (Variablennamen konsistent benennen)
- Offensichtliche Sicherheitsfixes
- Kleine Effizienz-Verbesserungen
- Aufräumen von Orphans, die durch die eigenen Änderungen entstanden sind

**Nicht erlaubt:** unaufgeforderte Architektur-Eingriffe, neue Abstraktionen, "ich hätte das anders gemacht"-Refactorings. Im Zweifel: erwähnen statt machen.

**Test:** Lässt sich jede geänderte Zeile direkt auf die Anfrage zurückführen?

**4. Goal-Driven Execution** — Erfolgskriterien vor Implementierung

Karpathy: *"LLMs are exceptionally good at looping until they meet specific goals... Don't tell it what to do, give it success criteria and watch it go."*

Imperative Tasks in verifizierbare Goals umwandeln:

| Statt... | Lieber... |
|----------|-----------|
| "Add validation" | "Schreib Tests für invalide Inputs, dann mach sie grün" |
| "Fix the bug" | "Schreib einen Test, der den Bug reproduziert, dann fix bis grün" |
| "Refactor X" | "Stell sicher, dass Tests vor und nach dem Refactoring grün sind" |

Bei Multi-Step-Tasks einen kurzen Plan: `Schritt → Verifikation` pro Punkt.

### Trade-off

Diese Prinzipien biasen auf **Sorgfalt vor Geschwindigkeit**. Bei Trivialitäten (Typo-Fix, Einzeiler) Urteilsvermögen nutzen — nicht jede Änderung braucht den vollen Rigor.

### Verhältnis zum Codebase-Audit

Karpathy 3 sagt "Don't refactor things that aren't broken". Der regelmäßige Codebase-Audit (siehe Teil 4 Do's und Teil 10) ist davon **nicht betroffen** — ein Audit ist explizit beauftragtes Refactoring mit klarem Scope (AI Slop entfernen, hardcodierte Strings konsolidieren, fehlende Validation nachziehen). Die Surgical-Changes-Regel verhindert nur ungebetenes Drive-by-Refactoring während anderer Tasks.

### Wo gehört das hin?

- **Globale `~/.claude/CLAUDE.md`** — wirkt für alle deine Coding-Sessions
- **Pro Projekt: `CLAUDE.md`** — das Template in `templates/CLAUDE.md` enthält den Block bereits, wird beim `cp` automatisch übernommen
- Optional: das [Karpathy-Repo](https://github.com/forrestchang/andrej-karpathy-skills) als Plugin installieren statt selbst zu pflegen — zentrale Updates, weniger Wartung, aber weniger Anpassbarkeit

---

## Teil 6: Die häufigsten Fallen — und wie du sie vermeidest

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
- **Regelmäßige Security-Reviews:** Nutze den Befehl `/security-review` in Claude Code, um deine App systematisch auf Schwachstellen prüfen zu lassen. Empfohlen: Alle 2-4 Wochen oder vor jedem größeren Release.

### Falle 6: Docker-Einschränkungen

**Problem:** Docker kann die Entwicklung verkomplizieren statt vereinfachen. Zu restriktive Container-Konfigurationen verhindern Debugging. Image-Builds dauern bei großen Projekten lange. ENV-Variablen werden falsch injiziert.

**Lösung:** Docker erst für Deployment einsetzen, nicht für die lokale Entwicklung. Lokal direkt mit `npm run dev` arbeiten. Multi-Stage-Builds nutzen (Build-Stage + schlanke Runtime-Stage). Docker-Compose nur für Production, nicht für Development.

### Falle 7: Headless-Betrieb und Hardware-Macken

**Problem:** Wenn du einen dedizierten Server (z.B. Mac Mini) für KI-Agents oder Automatisierungen nutzt, braucht macOS ein angeschlossenes Display. Ohne Display funktionieren manche Services nicht korrekt.

**Lösung:** HDMI-Dummy-Stecker kaufen (< 10 EUR), der dem System einen Monitor vortäuscht. Sleep-Mode deaktivieren. Services als LaunchAgents konfigurieren, die beim Systemstart automatisch starten.

### Falle 8: Session verloren durch IDE-Aktion

**Problem:** Wenn du Claude Code in der CLI innerhalb von VS Code nutzt und versehentlich ein neues Fenster öffnest oder einen neuen Ordner öffnest, schließt VS Code das Terminal — und eine laufende Claude Code Session geht verloren. Besonders ärgerlich bei langen Sessions mit viel aufgebautem Kontext.

**Lösung:** Die Session ist nicht wirklich weg. Im Terminal eingeben:

```bash
claude --resume
```

Das stellt die letzte Session wieder her — inklusive Kontext und Gesprächshistorie. **Tipp:** Gewöhne dir an, regelmäßig zu committen und Entscheidungen zu dokumentieren, damit selbst bei einem echten Session-Verlust nichts Wichtiges verloren geht.

---

## Teil 7: Specification Engineering — Der PRD-Prozess im Detail

### Was ist Specification Engineering?

Der wichtigste Shift beim AI-nativen Bauen 2025/2026: **Specification Engineering statt Prompt Engineering.** Statt einzelne Prompts zu optimieren, investierst du die Hauptarbeit in strukturierte, eindeutige Projekt-Spezifikationen. Je besser dein PRD und deine Dokumentation, desto weniger musst du bei der Implementierung nachsteuern.

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

## Teil 8: Die Dokumenten-Landschaft — Wo alles liegt

Welche Artefakte ein Projekt braucht (prd.md, architecture.md, backlog.md, decisions.md, concepts/, results/, meetings/, team/) und wie sie über den Projekt-Lebenszyklus zusammenarbeiten (Setup → Build → Post-Build), steht ausführlich im [**Modus Operandi**](modus-operandi.md):

- [§Unser Setup: 6 Artefakt-Typen](modus-operandi.md#unser-setup-6-artefakt-typen) — was jedes Dokument tut
- [§Vollständige Dokument-Landschaft](modus-operandi.md#vollständige-dokument-landschaft) — Ordnerstruktur für Solo + Team
- [§Projekt-Lebenszyklus](modus-operandi.md#projekt-lebenszyklus-wie-artefakte-zusammenarbeiten) — Flow: prd → architecture → backlog → concepts → Code → results
- [§7 backlog.md](modus-operandi.md#7-backlogmd--feature-registry-mit-stabilen-ids-pro-projekt-optional) — stabile Feature-IDs statt lokaler F-Nummern

**Faustregel für den Builder:** Vor jeder Session weiß die KI durch `CLAUDE.md` → `prd.md` → `architecture.md` → ggf. `backlog.md` und `docs/concepts/`, was zu tun ist. Nach jeder Session schreibst du `decisions.md` (Architektur-Entscheidungen) und ggf. `docs/results/[ID].md` (Post-Build-Lernen) zurück.

---

## Teil 9: Vom Solo-Projekt zum Team

Alles bis hierher funktioniert auch dann, wenn du allein mit Claude baust. Sobald ein zweiter Mensch dazukommt, kommen zwei Artefakt-Typen hinzu:

- **Mission-Dokument pro Person** (`docs/team/[name]-mission.md`) — Auftrag, Wochenplan, Blocker. Wird von Mensch und KI gelesen.
- **Meeting-Notiz pro Meeting** (`docs/meetings/YYYY-MM-DD-thema.md`) — Entscheidungen + Action Items, 5 Min nach dem Meeting.

`CLAUDE.md` verweist zusätzlich auf das Mission-Dokument, damit Claude weiß, was die Person gerade macht.

**Den vollen Team-Stack** (Meeting-Rhythmus, Bewertungskriterien, Eskalationsregeln, Wochen-Workflow, Kommunikations-Kanaltrennung, Bot-Integration, EU-AI-Act-konforme Bewertung) beschreibt der [**Modus Operandi**](modus-operandi.md) — er ist die Operating-Model-Schicht zu diesem Builder-Guide. Lies ihn, bevor du das zweite Teammitglied einlädst.

---

## Teil 10: Fortgeschrittene Techniken

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

## Teil 11: Der typische Projektlebenszyklus

### Woche 1-2: Foundation

1. Idee dokumentieren und PRD schreiben
2. PRD von der KI challengen lassen (2-3 Runden)
3. Tech-Stack festlegen
4. CLAUDE.md, architecture.md erstellen
5. Scaffolding (Projektstruktur anlegen lassen)
6. Erste Kernfunktion implementieren und deployen

### Woche 3-6: Kernfunktionen

7. Feature für Feature implementieren (eine Session = ein Feature)
8. Nach jedem Feature: Tests, Commit, Docs-Update
9. decisions.md wächst organisch
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

## Teil 12: Checklisten

### Checkliste: Projekt starten

- [ ] Problem und Zielgruppe definiert
- [ ] PRD geschrieben und von KI challenged
- [ ] Tech-Stack festgelegt
- [ ] CLAUDE.md erstellt
- [ ] architecture.md erstellt
- [ ] Git-Repository initialisiert
- [ ] .env-Datei in .gitignore
- [ ] Erste Kernfunktion implementiert und getestet
- [ ] Erster Commit mit sauberer Message

### Checkliste: Session beenden

- [ ] Alle Tests grün (`npm test`)
- [ ] decisions.md aktualisiert
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

## Teil 13: Glossar

| Begriff | Erklärung |
|---------|-----------|
| **Building with AI** | Sammelbegriff für AI-natives Bauen — umfasst Vibe Coding und Agentic Coding |
| **Vibe Coding** | Karpathys Begriff (Feb 2025) für schnelles, explorierendes Bauen mit KI — gut für Prototypen, nicht für Production-Software |
| **Agentic Coding** | Strukturiertes Bauen mit AI-Agenten (Spec → Plan → Execute), Sprachraum Anthropic/Cursor 2025/2026 |
| **PRD** | Product Requirements Document — beschreibt Was und Warum eines Produkts (Datei: `docs/prd.md`) |
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
