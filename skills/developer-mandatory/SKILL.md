---
name: developer-mandatory
description: Mandatory Karpathy guidelines + Superpowers toolkit for Frontend and Backend Mode B implementation. Use before coding, planning, TDD, debugging, or finishing a FE/BE branch. Project hard rules win on requirements and contracts.
---

# Mandatory toolkit — developer agents (FE / BE)

**Applies to:** Frontend and Backend workers in Mode B (build), and whenever writing, reviewing, or refactoring code. Mode A still follows the role’s domain checklist first; product truth stays analyst-owned.

These are **mandatory**, not optional. They do **not** override hard rules: no `requirements.md` edits, no peer contract renegotiation, cross-scope only via AnalystRequest, cite requirements version, Cursor-native (no custom orchestrator).

## 1. Karpathy behavioral guidelines (mandatory)

**Source:** [multica-ai/andrej-karpathy-skills — CURSOR.md](https://github.com/multica-ai/andrej-karpathy-skills/blob/main/CURSOR.md)

Install the upstream [`.cursor/rules/karpathy-guidelines.mdc`](https://github.com/multica-ai/andrej-karpathy-skills/blob/main/.cursor/rules/karpathy-guidelines.mdc) or skill under `skills/karpathy-guidelines/` so guidelines are active.

**Principles (follow; do not paste upstream rule text into requirements):**

1. **Think before coding** — surface assumptions; don’t hide confusion; present interpretations; ask when unclear.
2. **Simplicity first** — minimum code that solves the asked problem; no speculative abstractions.
3. **Surgical changes** — touch only what the task requires; match existing style; don’t “improve” unrelated code.
4. **Goal-driven execution** — define verifiable success criteria; loop until verified (tests/checks).

Uncertainty about **product/contract meaning** → AnalystRequest. Uncertainty about **implementation inside approved scope** → ask or state assumptions per Karpathy.

## 2. Superpowers (mandatory)

**Source:** [obra/superpowers](https://github.com/obra/superpowers/blob/main/README.md)  
**Cursor install:** `/add-plugin superpowers`

Use especially:

- **writing-plans** / **executing-plans** or **subagent-driven-development** — after scope is **ready** and requirements version is cited
- **test-driven-development** — red/green/refactor for code you own
- **systematic-debugging** / **verification-before-completion** — when fixing defects
- **requesting-code-review** / **finishing-a-development-branch** — before merge/PR handoff
- **using-git-worktrees** — when isolated branch work fits

### Conflict rule (Project / this plugin wins)

| Superpowers impulse | Required behavior |
|---------------------|-------------------|
| Brainstorm / invent product design before build | **Analyst** owns versioned requirements |
| Agree behavior with a peer agent in chat | **AnalystRequest** only for cross-scope / contracts |
| Expand scope (“while we’re here”) | **YAGNI** + Karpathy simplicity; out-of-scope → request or defer |
| Start coding before design sign-off | Only for **ready** FE/BE scope against cited `requirements.md` version |

Treat analyst-published requirements + GWT acceptance criteria as the signed design. Superpowers plans and TDD execute **inside** that design.

## Install checklist (per developer environment)

- [ ] Karpathy guidelines available as Cursor project rule and/or skill
- [ ] Superpowers plugin installed (`/add-plugin superpowers`)
- [ ] Agent checks for relevant Superpowers skills before implementation tasks
- [ ] Hard rules still enforced when skills suggest otherwise

## Related

- Agents: `frontend-developer`, `backend-developer`
- Domain review skills: `frontend-domain-review`, `backend-domain-review`
- Optional FE UI aid (not a requirements source): [checklist.design](https://www.checklist.design/)
