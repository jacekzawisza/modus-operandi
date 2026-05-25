# CLAUDE.md — [Projektname]

## Projekt
[Kurzbeschreibung in 1-2 Sätzen: Was wird gebaut und warum?]

## Deadline
[TT.MM.JJJJ] — [Kontext zur Deadline]

## Team
<!-- Nur bei Team-Projekten. Bei Solo-Projekten diesen Abschnitt entfernen. -->
→ Lies docs/team/[name]-mission.md für aktuellen Status.

## Was bauen wir?
→ Lies docs/prd.md (Product Requirements Document)
<!-- Sobald backlog.md existiert, zusätzlich: → Lies docs/backlog.md (Feature-IDs + Status) -->

## Tech-Stack + Standards
→ Lies docs/architecture.md

## Architektur-Entscheidungen
→ Lies docs/decisions.md

## Arbeitsweise
<!-- Solo: → Lies docs/modus-operandi.md -->
<!-- Team: → Lies docs/team/modus-operandi.md -->

## Coding-Prinzipien (Karpathy-Regeln)

Vier universelle Regeln für jede Code-Session. Quelle: Andrej Karpathy via [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills).

**1. Think Before Coding.** Annahmen explizit machen. Bei Mehrdeutigkeit Interpretationen aufzeigen statt zu raten. Wenn etwas unklar ist: stoppen und fragen. Wenn ein einfacherer Ansatz existiert: sagen.

**2. Simplicity First.** Minimum Code, der das Problem löst. Keine Features über das Gefragte hinaus. Keine Abstraktionen für Single-Use-Code. Keine "Flexibility", die nicht angefordert wurde. Kein Error-Handling für unmögliche Fälle. Wenn 200 Zeilen auch in 50 gehen: 50 schreiben.

**3. Surgical Changes.** Nur das anfassen, was nötig ist. Kein Drive-by-Refactoring von Architektur. Existierenden Stil matchen. **Erlaubt im Vorbeigehen:** kleine Style-Angleichungen (Variablennamen konsistent), offensichtliche Sicherheits-/Effizienzfixes, Aufräumen von Orphans aus eigenen Änderungen. **Nicht erlaubt:** unaufgeforderte Architektur-Eingriffe oder neue Abstraktionen. Im Zweifel: erwähnen statt machen.

**4. Goal-Driven Execution.** Erfolgskriterien vor Implementierung definieren. Bei Bugs: Test, der den Bug reproduziert, dann Fix bis Test grün. Bei Features: Akzeptanzkriterien als Checkliste. Bei Multi-Step-Tasks: Plan mit "Schritt → Verifikation" pro Punkt, dann loopen bis verifiziert.

**Trade-off:** Sorgfalt vor Geschwindigkeit. Bei Trivialitäten (Typo-Fix, Einzeiler) Urteilsvermögen nutzen.

## Coding-Konventionen
<!-- Projekt-spezifische Regeln, die Claude sofort sehen soll: -->
- [z.B. TypeScript strict mode]
- [z.B. Deutsche UI-Texte]
- [z.B. JSONB-Writes: Immer `$1::jsonb` Cast]

## Gotchas / Bekannte Fallen
<!-- Bugs oder Patterns, die Claude nicht wiederholen soll: -->
- [z.B. DATE-Spalten = Strings, nie `new Date()` darauf]
