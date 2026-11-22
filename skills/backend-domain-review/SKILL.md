---
name: backend-domain-review
description: Backend Mode A checklist for API/data/job implementability of analyst-owned requirements — ops matrix, states, provider contracts, authz, lifecycle. Use when reviewing as Backend or deciding BE ready.
---

# Backend domain review checklist

Use in **Mode A — Requirements review**. Review current analyst-owned `requirements.md` only. Do not edit it. File gaps via skill `analyst-request` (`From: backend`).

**Cite:** feature id + `Version:` before you start. Stale-version review is invalid.

Scale: **OK** / **Gap (file request)** / **N/A (reason)** / **Assumption (document — not a silent product decision)**.

## 1. Traceability & operations inventory

- [ ] In-scope entities/operations map to stories/UC/goals
- [ ] No required system/timer step missing; no invented ops; out-of-scope integrations explicit

## 2. Conceptual domain → implementability

- [ ] Entities/relationships/multiplicities clear enough for physical schema without changing meaning
- [ ] Odd cardinalities have business rules; identity/uniqueness/soft-delete intent stated or N/A
- [ ] Derived vs stored facts unambiguous when they affect APIs/reports

## 3. States & transitions

Where status exists: exclusive states; allowed transitions/triggers; side effects; illegal paths/errors; diagrams sufficient.

## 4. Operations matrix (CRUD + LSHAX-style)

Per in-scope object: C/R/U/D + List/Search/History/Archive/eXecute or N/A; rights; conditions; side effects/undo/audit.

## 5. API / contract — provider view

Gaps → AnalystRequest with `Affects contract: yes`, neighbor **frontend** (+ qa).

- [ ] Endpoints/operations; request/response fields/types
- [ ] Authn/authz per operation; domain/auth error shapes
- [ ] Pagination/filter/sort; idempotency for risky writes
- [ ] Partial failure / multi-step orchestration; events/webhooks when used
- [ ] Compatibility if touching an existing API

## 6. Validation & invariants

- [ ] Server-side rules vs client hints clear; cross-entity rules; concurrency intent
- [ ] Authorization on every mutating path (do not trust the client)

## 7. Jobs, timers, integrations

- [ ] Triggers/schedules/setup; inputs/side effects; failure/retry/observability
- [ ] Delivery semantics when they matter; adjacent-system ownership named

## 8. Data lifecycle & ops

- [ ] Seed/test data; migration/cutover/parallel-run; retention/archive/purge
- [ ] Admin/ops/report/import; monitoring/audit signals

## 9. Security & privacy

- [ ] Who can act vs read; sensitive fields; secrets boundaries; escalate compliance silence

## 10. Analyst artifact sufficiency (review only)

Do not rewrite glossary/diagrams/matrix. File if insufficient for BE.

## 11. Ready gate (backend)

1. No open **blocking** BE AnalystRequests against current version
2. Non-blocking deferred with acknowledgment or fixed in-version
3. Interfaces BE provides/consumes explicit enough (or out of scope)
4. Behavioral flows have GWT AC; file if flow AC missing/checklist-only/contradictory

## Anti-patterns

Approving ready because Frontend looks fine; agreeing payloads with FE in a PR; inventing business rules for a “nice” schema; returning undocumented 500s as error contract; building against uncited/superseded version; equating physical schema convenience with product truth.
