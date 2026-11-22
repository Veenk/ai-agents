---
name: qa-testability
description: QA testability review checklist, durable cases under docs/features/<id>/qa/, and verification against cited requirements. Use for qa-prep readiness or feature verification.
---

# QA testability & verification

Use in **Mode A** for testability review; **Mode B** for durable cases + verification. Do not edit `requirements.md`. File gaps via skill `analyst-request` (`From: qa`).

**Cite:** feature id + `Version:` before you start. Stale-version work is invalid.

## Mode A — Testability checklist

Scale: **OK** / **Gap (file request)** / **N/A (reason)** / **Assumption (document)**.

### 1. Acceptance criteria quality

- [ ] Behavioral flows use **Given/When/Then**
- [ ] Non-flow items use short checklists only
- [ ] No contradictory Then clauses; primary happy paths covered

### 2. Oracle & observability

- [ ] Pass/fail observable (UI/API/event/record/message) — not “works well”
- [ ] Side effects assertable or explicitly untested; errors distinguishable

### 3. Controllability & preconditions

- [ ] Actors/roles defined; seed/setup producible; timers forceable or deferred; permissions for allow/deny clear

### 4. Risk slices (presence)

- [ ] Authz denied; validation invalids; empty/not-found/conflict; illegal transitions; idempotency when required; FE↔BE contract consistency

### 5. Traceability

- [ ] AC linkable to UC/screens/ops; no orphan critical paths; out-of-scope not mistaken as required tests

### 6. Analyst artifact sufficiency

File if glossary/diagrams/contracts insufficient to interpret expected results.

### 7. Ready gate (qa-prep)

1. No open **blocking** QA AnalystRequests against current version
2. Non-blocking deferred with acknowledgment or fixed in-version
3. Primary flows have GWT (or explicit N/A) clear enough to derive cases
4. Oracles and preconditions sufficient to later verify the developed version

## Mode B — Durable artifacts & verification

**Always load existing** `docs/features/<feature-id>/qa/` first — do not reinvent the suite every run.

| Path | Contents |
|------|----------|
| `…/qa/cases.md` | Scenarios (GWT for flows); `Cases-for-requirements-version: <n>` |
| `…/qa/results.md` (or dated) | Pass/fail + evidence against named version and build/PR |
| `…/qa/README.md` (optional) | Index / how to run |

### Verify checklist

- [ ] Cases traced to AC/FR ids; version stamp current
- [ ] Happy + key negatives + authz + empty/error where in scope
- [ ] Version under test matches (or was re-reviewed after) the developed version
- [ ] Evidence captured; defects vs AnalystRequests routed correctly
- [ ] Sign-off cites feature id + requirements version + result summary

**Defects** (code disagrees with clear requirements) → tracker to FE/BE. **Truth gaps** → AnalystRequest. Pause Blocking verification until cleared.

## Anti-patterns

Approving testability because FE/BE said ready; inventing behavior in cases; happy-path-only for flows; verifying against PR description instead of cited version; silent interpretation of ambiguous Then clauses.
