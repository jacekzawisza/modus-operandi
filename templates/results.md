# results.md — [Projektname]

_Stand: [Datum]_

_Outcome-Tracking pro abgeschlossenem Feature. Schließt den Closed Loop zwischen `backlog.md` (was war geplant) und Realität (was funktioniert)._

---

## Sinn dieses Files

`backlog.md` sagt **was geplant ist**, `decisions.md` sagt **warum gebaut wurde**, `product.md` sagt **wohin es geht**. Was fehlt: **Was tatsächlich passiert ist, nachdem das Feature live war.**

Ohne dieses File hast du keinen Lern-Mechanismus. Du baust, du shippst, du vergisst. Beim nächsten Feature wiederholst du Fehler, oder du wiederholst Patterns, die nicht gewirkt haben, weil niemand sie nachgezählt hat.

Inspiriert durch Dave Blundins `results.md`-Disziplin pro Training-Run (Substack DB2-Tour Part 4). Übertragen auf jedes Feature, das ein echter Nutzer berührt.

---

## Wann ein Eintrag entsteht

- **Nicht bei jedem Bugfix.** Trivialitäten brauchen kein Result.
- **Pflicht** bei jedem Feature, das einen echten Nutzer-Workflow ändert (UI-Feature, Bot-Funktion, neue Pflichtangabe, ...).
- **Pflicht** bei jedem Experiment, dessen Outcome nicht vorher feststand (A/B, neue Sub-Reboot-Mail, neuer Sales-Pitch, ...).
- Entsteht **frühestens 24h nach Go-Live** (sonst keine Real-User-Daten) und **spätestens 7 Tage danach** (sonst vergessen).

---

## Ablage

Ein File pro Feature: `docs/results/[ID].md`, z.B. `docs/results/FW-040.md`.

Wenn das Repo schon `docs/concepts/[ID]-*.md` für Plan-Files hat, ist `docs/results/[ID].md` der Spiegel auf der Outcome-Seite.

---

## Template

```markdown
# Result — [ID] [Feature-Name]

**Live seit:** [TT.MM.JJJJ]
**Pilot-Nutzer:** [wer hat real getestet, z.B. Mirko / Lucille / Hahn-Demo]
**Status:** [holding / iterating / killed / shipped-as-is]

## Hypothese (aus dem Plan)

[1-2 Sätze: Was sollte das Feature lösen? Welche Annahme stand dahinter? Aus dem zugehörigen Plan-File / Konzept kopiert oder paraphrasiert.]

## Was tatsächlich gebaut wurde

[Falls abweichend vom Plan: was wurde weggelassen, was kam dazu, was wurde anders gemacht.]
[Falls 1:1 wie geplant: "Wie geplant umgesetzt."]

## Outcome — harte Daten

- **Nutzungs-Frequenz:** [z.B. "3 von 7 Touren in Woche 1", "Mirko hat 12x geklickt"]
- **Adoption / Conversion:** [Anteil der relevanten Fälle, in denen das Feature genutzt wurde]
- **Performance-Metriken:** [Reaktionszeit, Fehlerrate, Token-Cost falls relevant]
- **Tracking-Events:** [Welche `user_events` belegen das? Query falls hilfreich]

## Outcome — weicher Feedback

- **Verbatim-Zitat 1:** [Original-Aussage des Nutzers, möglichst wörtlich]
- **Verbatim-Zitat 2:** [...]
- **Stimmung:** [positiv / neutral / abwehrend / verwirrt]
- **Nicht gesagt, aber beobachtet:** [Was war auffällig, was hat der Nutzer NICHT gefragt, NICHT angeklickt]

## Überraschungen

[Was war anders als gedacht? Bugs, die nicht aufgefallen wären? Patterns, die du nicht erwartet hast?]

## Lernen → nächste Iteration

- **Bestätigte Annahmen:** [...]
- **Widerlegte Annahmen:** [...]
- **Neue Feature-Ideen:** [z.B. "FW-NNN — präzisiere Lead-Pattern für Hülskens-Touren"]
- **Was wir killen sollten:** [...]

## Cross-Refs

- Plan-File: `docs/concepts/[ID]-*.md`
- Commit-Hash: `[abc1234]`
- Backlog-Eintrag: siehe `backlog.md` Zeile [ID]
- Meeting / Anlass: `docs/meetings/[YYYY-MM-DD]-*.md`
```

---

## Integration in den Workflow

### Beim Commit eines Features
- Backlog-Status: `in-progress` → `done`
- **Plus:** Stub-Eintrag in `docs/results/[ID].md` mit "Live seit", offenen Outcome-Feldern und Plan-File-Verweis. Reminder für dich selbst.

### Innerhalb 7 Tage nach Go-Live
- Stub vervollständigen: harte Daten aus Tracking + weicher Feedback aus User-Gespräch / WhatsApp-Logs / Telefonat-Transkript.
- Nicht perfekt machen — 80% reicht. Hauptsache geschrieben.

### Monatlicher Re-Read
- Alle `docs/results/*.md` der letzten 4 Wochen kurz überfliegen.
- Pattern-Hypothese ableiten: "3 Features wurden weniger genutzt als gedacht — was haben sie gemeinsam?"
- Wenn ja: neuen Eintrag in `decisions.md` mit dem Pattern + Konsequenz.

### Vor jedem Plan-File für ein neues Feature
- Such-Filter über `docs/results/`: gibt es ein verwandtes Feature, dessen Outcome ich kennen sollte, bevor ich dieses plane?
- Wenn ja: kurz lesen, im neuen Plan-File darauf verweisen.

---

## Was dieses File NICHT ist

- **Nicht** eine Sales-Story für Investor-Updates (separate Datei, eigene Sprache).
- **Nicht** ein Changelog (`CHANGELOG.md` hat seine eigene Form).
- **Nicht** ein Bug-Tracker (Bugs landen im Backlog mit eigener ID).
- **Nicht** ein Vertriebs-Tagebuch (Lead-Status gehört in `leads.md` / CRM).

`results.md`-Einträge sind **kurze, ehrliche Outcome-Notizen für dich selbst und für deinen zukünftigen AI-Co-Piloten**, der sie liest, um bei neuen Features sinnvolle Vorschläge zu machen.

---

_Siehe auch: [modus-operandi.md §4c](../modus-operandi.md) — die Lern-Schicht zwischen Output und nächster Iteration._
