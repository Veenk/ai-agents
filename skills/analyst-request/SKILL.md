---
name: analyst-request
description: AnalystRequest template, requester checklist, and when FE/BE/QA must file findings instead of renegotiating. Use when filing or resolving a requirements gap, contract impact, or blocker.
---

# AnalystRequest

Create under `docs/features/<feature-id>/findings/<short-slug>.md` (or append to an open findings log with the same fields).

## Template

```markdown
# AnalystRequest: <short title>

- **Id:** <feature-id>-F<n>
- **From:** frontend | backend | qa | other
- **Stage:** requirements-review | development
- **Blocking:** yes | no
- **Requirements version:** <n>
- **Domain:** UI | API | data | security | testability | other
- **Affects contract:** yes | no
- **Affects neighbor scopes:** none | frontend | backend | qa | list…
- **Status:** open | answered | incorporated | withdrawn

## Gap / blocker
What is missing, ambiguous, wrong, or newly discovered.

## Why it matters
Impact on this scope and on any neighbor (API shape, shared state, UX flow, testability).

## Question for analyst
Exact decision or clarification needed.

## Proposed option (optional)
One concrete proposal the requester would accept.

## Analyst resolution
(Filled by analyst: decision, requirements edits, new version, who must re-review.)
```

## Requester checklist

- Point at the requirements section or omission.
- Say whether work is blocked.
- Name neighbor scopes if the contract or shared behavior changes.
- Do not continue the blocked scope until status is `incorporated` (or `answered` with explicit “no requirements change”).
- Do not edit `requirements.md`. Do not treat chat/PR agreement with another role as resolution.

## Analyst checklist (summary)

- Answer the question; update `requirements.md` when the truth changes.
- Bump `Version:`; list scopes that must re-review; set status.
- Prefer clarify-and-supplement; name true external/reg change when rare.
- Full analyst-side procedure: skill `analyst-completeness` (finding resolution section).

## Analyst resolution block

```markdown
## Analyst resolution

- **Decision:** <accepted proposal | alternative | deferred | escalated>
- **Kind:** clarification | completeness-gap | contract-change | external-change | out-of-scope
- **Requirements change:** none | yes → see Version <n>
- **New version:** <n or n/a>
- **What changed:** <one–three bullets pointing at sections>
- **Completeness artifacts updated:** <none | glossary | process | …>
- **Re-review required:** none | frontend | backend | qa | list…
- **Blocking cleared:** yes | no | n/a
- **Status set to:** answered | incorporated | open (waiting on …)
- **Notes:** <optional>
```

## Status meanings

| Status | Meaning |
|--------|---------|
| `open` | Unresolved; blocked scope stays paused if Blocking=yes |
| `answered` | Resolved; **no** requirements edit needed |
| `incorporated` | Requirements updated; new version published |
| `withdrawn` | Requester withdrew |

## Role-specific triggers (quick)

| From | File when |
|------|-----------|
| **frontend** | Missing screens/states/forms/a11y; API consumer gaps; UI business rules unclear; contract mismatch in build |
| **backend** | Missing ops/states/invariants; provider API/error/auth gaps; jobs/lifecycle unclear; contract mismatch in build |
| **qa** | Unverifiable/contradictory AC; missing oracle; authz/error paths untestable; requirements wrong vs intended product |

Do **not** file for pure implementation choices inside approved scope, tool/CI flakes, or questions already answered in the current version (re-read first).

## FE optional aid

[checklist.design](https://www.checklist.design/) may prompt UI completeness during FE review — it does not replace AnalystRequest or `requirements.md`.
