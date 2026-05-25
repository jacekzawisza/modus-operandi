# PRD — [Produktname]

_Product Requirements Document. Definiert WAS gebaut wird und WARUM. Vor erstem Code mit KI challengen (2-3 Runden)._

_Stand: [Datum]_

---

## 1. Problem / Motivation
[Welches Problem lösen wir? Warum bauen wir das?]

## 2. Zielgruppe
[Wer nutzt es? Persona beschreiben: Rolle, Kontext, Schmerzpunkte]

## 3. Produktvision
[1-2 Sätze: Was ist das Produkt, wenn es fertig ist?]

## 4. Nicht-Ziele (explizit NICHT im Scope)
- [Was bauen wir bewusst NICHT?]
- [Was ist eine Erweiterung für später?]

## 5. Tech-Stack (Kurzübersicht)

| Komponente | Technologie | Begründung |
|-----------|-------------|------------|
| Framework | [z.B. Next.js] | [Warum?] |
| Datenbank | [z.B. PostgreSQL] | [Warum?] |
| Hosting | [z.B. Hetzner + Coolify] | [Warum?] |

> Datenmodell, Ordnerstruktur und Konventionen gehören in `architecture.md`.

## 6. Roadmap (Phasen-Narrative)

Nur **Phasen-Themen** hier — keine Feature-Listen. Konkrete Features pro Phase stehen im [`backlog.md`](backlog.md) (Spalte `Phase`). Roadmap-Sicht = Backlog gefiltert nach Phase.

### Phase 1: [Thema] ([Zeitraum])

**Deadline: [Datum] — [Kontext zur Deadline]**

[2–4 Sätze: Welches Nutzer-Problem löst diese Phase? Wie sieht "Phase abgeschlossen" aus? Wofür ist sie die Grundlage?]

**Meilensteine:**

| Woche | KW | Meilenstein | Status |
|-------|-----|-----------|--------|
| 1 | XX | [Meilenstein] | ☐ |
| 2 | XX | [Meilenstein] | ☐ |

### Phase 2: [Thema] ([Zeitraum])

[2–4 Sätze nach gleichem Schema]

## 7. Erfolgskriterien

- [ ] [Woran erkennt man, dass es funktioniert?]
- [ ] [Messbare KPIs]

## 8. Risiken

| Risiko | Wahrscheinlichkeit | Impact | Mitigation |
|--------|-------------------|--------|------------|
| [Risiko 1] | [H/M/N] | [H/M/N] | [Maßnahme] |

## 9. Offene Fragen

- [Was muss noch geklärt werden?]

---

_Dieses PRD wurde von der KI challenged (Runde: [1/2/3]). Letzte Überarbeitung: [Datum]._
_Wird selten aktualisiert — nur bei Scope-Änderungen. Meilenstein-Status wird bei Reviews mitgeführt._
