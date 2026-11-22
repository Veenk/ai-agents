---
name: frontend-domain-review
description: Frontend Mode A checklist for UI implementability of analyst-owned requirements — screens, states, forms, a11y, consumer contracts. Use when reviewing requirements as Frontend or deciding FE ready.
---

# Frontend domain review checklist

Use in **Mode A — Requirements review**. Review current analyst-owned `requirements.md` only. Do not edit it. File gaps via skill `analyst-request` (`From: frontend`).

**Cite:** feature id + `Version:` before you start. Stale-version review is invalid.

**Optional aid:** [checklist.design](https://www.checklist.design/) may prompt UI/UX completeness. It does **not** replace this checklist, GWT flow AC, or `requirements.md`.

Scale: **OK** / **Gap (file request)** / **N/A (reason)** / **Assumption (document — not a silent product decision)**.

## 1. Traceability & screen inventory

- [ ] Every in-scope UI surface maps to a story/UC/goal
- [ ] No required journey missing a screen/step; no invented screens
- [ ] Out-of-scope UI is explicit

## 2. Navigation & IA

- [ ] Entry points / wayfinding clear enough to route
- [ ] Back/cancel/undo stated or safely defaultable
- [ ] Deep links / return paths when needed
- [ ] Role-based nav visibility when roles differ

## 3. Per-screen implementability

- [ ] Primary action (or explicit multi-action rules)
- [ ] Defaults; validation; error presentation intent
- [ ] Success outcome; empty / loading / error / success
- [ ] Offline / overflow when relevant; destructive confirm/undo

## 4. Forms & input

- [ ] Required vs optional; formats/ranges/cross-field rules
- [ ] Server vs client validation split clear enough
- [ ] Inline vs submit-time errors; disabled/submit conditions; prefill/edit vs create

## 5. Accessibility (basics)

- [ ] Names/labels; keyboard for primary flows; focus/modal behavior
- [ ] Error association; non-color-only status cues
- [ ] Project a11y baseline if silent (Assumption — escalate if product-critical)

## 6. Responsive / breakpoints

- [ ] Multi-viewport required or single-viewport explicit
- [ ] Flow-changing layout shifts called out; touch/dense tables addressed or deferred

## 7. Design system & consistency

- [ ] Design-system fit or documented local assumptions without changing product meaning
- [ ] Copy / empty-state messaging hooks present or defaultable

## 8. API / contract — consumer view

Gaps that change payloads/errors/auth → AnalystRequest with `Affects contract: yes`, neighbor **backend**.

- [ ] Endpoints/operations per screen/action
- [ ] Fields UI must show/send; auth/session failures; domain errors to surface
- [ ] Pagination/filter/sort; idempotency/double-submit; composed-call loading/partial failure

## 9. Business rules visible in UI

- [ ] Show/hide, enable/disable, conditional copy explicit
- [ ] State-machine UI matches analyst diagrams; permissions clear
- [ ] No FE-invented policy to “make the demo work”

## 10. Analyst artifact sufficiency (review only)

Do not rewrite glossary/diagrams. File if insufficient for UI.

## 11. Ready gate (frontend)

1. No open **blocking** FE AnalystRequests against current version
2. Non-blocking deferred with acknowledgment or fixed in-version
3. Interfaces UI consumes explicit enough (or out of scope)
4. Behavioral flows have GWT AC; file if flow AC missing/checklist-only/contradictory

## Anti-patterns

Approving ready because Backend looks fine; agreeing payloads with BE in a PR; improvising empty/error states; building against uncited/superseded version; rewriting glossary/process instead of filing sufficiency gaps.
