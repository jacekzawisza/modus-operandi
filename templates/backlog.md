# backlog.md — [Projektname]

_Stand: [Datum]_

_Stabile Feature-IDs. Nicht umnummerieren. Killed-IDs bleiben killed._

---

## Konvention

- **ID-Schema:** `[PREFIX]-NNN` (z.B. `FW-001`, `DC-042`)
- **Prefix:** Projektkürzel, max. 4 Zeichen — einmal festlegen, nie ändern
- **Nummerierung:** fortlaufend, **nie wiederverwendet** (auch nicht bei `killed`)
- **Referenzierung:** In Meeting-Notizen, Commits, PRs, Konzepten immer per ID — nie mehr mit lokalen F-Nummern

## Status-Werte

| Status | Bedeutung |
|--------|-----------|
| `hypo` | Hypothese aus Meeting/Idee, noch nicht mit Nutzer validiert |
| `validated` | Mit Kunde/Nutzer bestätigt, aber noch kein Code |
| `in-progress` | Aktuell in Arbeit (Branch offen, Session läuft) |
| `done` | Implementiert, im Commit referenziert |
| `killed` | Verworfen — Begründung in `decisions.md` |

## Features

| ID | Name | Phase | Status | Quelle | Notiz |
|----|------|-------|--------|--------|-------|
| XX-001 | [Feature-Name] | 1 | hypo | meetings/YYYY-MM-DD-x.md | [Kurzer Kontext, nächster Schritt] |
| XX-002 | [Feature-Name] | 1 | validated | meetings/YYYY-MM-DD-x.md | [z.B. "mit [Nutzer] bestätigt am X"] |
| XX-003 | [Feature-Name] | 1 | in-progress | — | [z.B. Branch feat/xx-003] |
| XX-004 | [Feature-Name] | 2 | done | meetings/YYYY-MM-DD-x.md | Commit [hash], Version v0.X.Y |
| XX-005 | [Feature-Name] | — | killed | meetings/YYYY-MM-DD-x.md | Siehe decisions.md YYYY-MM-DD: [Grund] |

> **Phase**: Verweist auf die Phasen aus `prd.md` (Abschnitt "Roadmap"). Damit ist Filter nach Phase = aktuelle Roadmap-Sicht. Killed Features bekommen `—`.

---

## Workflow

**Neues Feature aus Meeting:**
1. Während Meeting-Destillation: nächste freie ID vergeben
2. Zeile in backlog.md eintragen (Status `hypo`)
3. In Meeting-Note per `[XX-NNN]` referenzieren

**Feature validiert:**
- Status `hypo` → `validated`, Notiz ergänzen (wer, wann bestätigt)

**Feature wird gebaut:**
- Status `validated` → `in-progress`, Branch-Name in Notiz
- Commit-Message: `feat: XX-NNN [Feature-Name]`

**Feature fertig:**
- Status `in-progress` → `done`, Commit-Hash + Version in Notiz

**Feature verworfen:**
- Status (egal) → `killed`, Eintrag in `decisions.md` mit Begründung
- ID bleibt in backlog.md stehen — NICHT löschen, NICHT wiederverwenden

---

## Verhältnis zum PRD

`prd.md` beschreibt die **Phasen-Narrative** (was wir in Phase 1 / 2 / ... lösen wollen, in welchem Zeitraum). Konkrete Feature-Listen pro Phase stehen **nicht** im PRD, sondern hier — über die `Phase`-Spalte. So gibt es keine Doppelpflege:

- **PRD** = grobe Phasen-Themen, selten geändert
- **Backlog** = Features mit ID, Phase, Status, operativ gepflegt
- **Roadmap-Sicht** = Backlog gefiltert nach Phase

---

_Siehe auch: [modus-operandi.md §7](../modus-operandi.md) für das Konzept hinter stabilen IDs._
