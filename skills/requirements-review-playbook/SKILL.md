---
name: requirements-review-playbook
description: Cursor-first multi-agent requirements review loop — roles, Context layout, AnalystRequest cycle, scope ready, mapping onto Cursor. Use when starting a feature, coordinating review/build, or checking readiness.
---

# Requirements review playbook (Cursor-first)

Minimal process for multi-agent feature work inside Cursor. Prefer Projects, tracked tasks, Context, rules/skills, and Cloud Agents. Do not introduce a custom orchestrator unless a clear Cursor gap appears.

## Roles

| Role | Owns | Does not own |
|------|------|--------------|
| **Product owner (human)** | Brief, business priorities, accept/reject, escalate blockers | Not an agent — **you** (with coordinator routing) |
| **System Analyst** | Current requirements version, completeness artifacts, answering findings, contracts | Implementation inside approved scope; physical DB schema |
| **Frontend Developer** | FE domain review + FE implementation; AnalystRequests for FE gaps | Changing shared requirements or BE contracts unilaterally |
| **Backend Developer** | BE domain review + BE implementation; AnalystRequests for BE gaps | Changing shared requirements or FE contracts unilaterally |
| **QA Engineer** | Testability review, durable cases, verification findings | Rewriting product requirements |

No PM agent pack. Developer agents (FE/BE) also load skill `developer-mandatory`.

## Single source of truth (per feature in Project Context)

- `docs/features/<feature-id>/brief.md` — product brief (human)
- `docs/features/<feature-id>/requirements.md` — **only** the analyst updates; bump `Version:` on every change
- `docs/features/<feature-id>/findings/` — one file or section per AnalystRequest (open → resolved)
- `docs/features/<feature-id>/qa/` — durable QA cases + results (QA owns; load/update each run)
- Tracker task — status and links; name the **outcome**, not the step

Developers and QA read the current `requirements.md` version. Work against a stale version is invalid.

## Loop

```
Brief → Analyst draft → parallel domain review → findings → Analyst revision
      ↺ until scopes ready → parallel development → (findings if needed) → QA → human accept
```

1. Human produces `brief.md` — no PM agent.
2. Analyst publishes requirements v1.
3. FE / BE / QA review in parallel against their domain only.
4. Each reviewer marks scope ready or files AnalystRequest(s) (skill `analyst-request`).
5. Analyst resolves, publishes new version, notes what changed and who re-reviews.
6. Repeat until required scopes are ready.
7. Ready scopes may start development independently.
8. During development, blocker / contract / neighbor impact → AnalystRequest; pause until resolved + version bump.
9. QA verifies against the version that was developed; human accepts.

### Hard rules

- Cross-scope and contract-impact changes go **only through the analyst**.
- Developers may propose; they do not edit `requirements.md`.
- Blocking findings stop the affected scope (and dependents the analyst marks).
- Technical failure may retry; missing business info escalates via AnalystRequest or to human.
- No review-round cap; escalate to human only for business blockers or cycling without new information.
- Clarity, glossary, Mermaid diagrams required.
- Prefer clarify-and-supplement over silent rewrite.
- Analyst completeness pack before scopes ready (skill `analyst-completeness`).

## Scope ready

A scope (frontend / backend / qa-prep) is **ready** when:

1. No open **blocking** AnalystRequests against the current version from that domain.
2. Non-blocking items deferred with analyst/human acknowledgment or fixed in-version.
3. Interfaces touching other scopes explicit enough to implement without guessing (or out of scope).
4. QA can derive acceptance checks for that scope from current requirements text.

Development starts only when that scope is ready. A later AnalystRequest can revoke readiness until re-reviewed.

## Mapping onto Cursor

| Need | Cursor-native place |
|------|---------------------|
| Feature outcome | Tracked task |
| Role behavior | This plugin: rules / agents / skills |
| Brief, requirements, findings, QA | Project Context (`docs/features/...`) |
| Parallel review / build | Separate agents / workers per role |
| Code isolation | Branch + PR per scope or feature |
| Human gate | Task For Review; PR review; chat decision |

Coordinator routes who runs next and keeps the tracker honest. It is **not** part of this plugin.

## First dry run

Pick one small feature: brief → requirements v1 → FE+BE(+QA) review → at least one AnalystRequest → revision → one scope ready → tiny implementation. Adjust Project process only where the dry run hurts.
