# ai-agent-roles

Portable **Cursor Plugin** with the multi-agent role system: System Analyst, Frontend, Backend, QA — plus always-on rules (AnalystRequest gate, no PM agent, GWT AC, clarity, Cursor-native) and skills (playbook, AnalystRequest, completeness, domain reviews, developer toolkit).

**Plugin = portable kit.** Each Project still needs its own tracker, Context (`docs/features/...`), and coordinator chat. Those are **not** in this plugin.

---

## Install locally / Локальная установка

### English

1. Copy this folder to `~/.cursor/plugins/local/ai-agent-roles`  
   - Prefer extracting `ai-agent-roles.tar.gz` (includes `.cursor-plugin/plugin.json`).  
   - Or run `./install-local.sh` from this directory.
2. **Developer: Reload Window** (or restart Cursor).
3. Open **Customize** → confirm rules, agents, and skills from `ai-agent-roles`.
4. For FE/BE coding sessions, also install Superpowers (`/add-plugin superpowers`) and Karpathy guidelines per skill `developer-mandatory`.

If the folder was synced without a hidden `.cursor-plugin/` directory (some stores strip dotdirs), ensure:

```bash
mkdir -p ~/.cursor/plugins/local/ai-agent-roles/.cursor-plugin
cp cursor-plugin/plugin.json ~/.cursor/plugins/local/ai-agent-roles/.cursor-plugin/plugin.json
```

### Русский

1. Скопируйте папку в `~/.cursor/plugins/local/ai-agent-roles`  
   - Удобнее распаковать `ai-agent-roles.tar.gz` (внутри есть `.cursor-plugin/plugin.json`).  
   - Или выполните `./install-local.sh`.
2. **Developer: Reload Window** (или перезапустите Cursor).
3. **Customize** → убедитесь, что видны rules / agents / skills плагина.
4. Для FE/BE дополнительно: Superpowers (`/add-plugin superpowers`) и Karpathy guidelines (skill `developer-mandatory`).

Если после синхронизации нет скрытой `.cursor-plugin/`:

```bash
mkdir -p ~/.cursor/plugins/local/ai-agent-roles/.cursor-plugin
cp cursor-plugin/plugin.json ~/.cursor/plugins/local/ai-agent-roles/.cursor-plugin/plugin.json
```

---

## What is in the plugin / Что внутри

| Component | Contents |
|-----------|----------|
| **rules/** | AnalystRequest gate; no PM agent; GWT AC; requirements clarity; Cursor-native; FE/BE developer toolkit |
| **agents/** | `system-analyst`, `frontend-developer`, `backend-developer`, `qa-engineer` |
| **skills/** | Playbook, AnalystRequest, analyst completeness (+ template), FE/BE/QA domain checklists, developer-mandatory |

## What is NOT in the plugin / Чего нет

- Live Project **tracker** / task statuses  
- Live **Context** feature docs (`brief.md`, `requirements.md`, findings, QA results)  
- **Coordinator** / orchestrator chat  
- Product Manager **agent** (product owner = human)  
- Marketplace publish (local package only)  
- Full copyrighted book/standard text (practice checklists we authored only)  
- MCP for checklist.design (documented link only)

## FE optional tool

[checklist.design](https://www.checklist.design/) — optional UI/UX aid for Frontend. Does not replace requirements or AnalystRequest.

## Version

`0.1.0` — author Vladislav Kasintsev.

## License

MIT — see [LICENSE](./LICENSE).

Repository: https://github.com/Veenk/ai-agents
