# Migration Guide

如果你从旧版 `agent-project-starter-template` 迁移到新版 `agent-template`，可以按下面规则调整路径。

## 旧结构

```text
feature_list.json
feature_list.schema.json
session-handoff.md
logs/progress-log.md
docs/decision-log.md
checklists/
skills/
projects/
```

## 新结构

```text
.harness/state/feature_list.json
.harness/state/feature_list.schema.json
.harness/state/session-handoff.md
.harness/logs/progress-log.md
.harness/decisions/decision-log.md
.harness/checklists/
.harness/skills/
src/ 或 apps/
```

## 迁移规则

| 旧路径 | 新路径 |
|---|---|
| `feature_list.json` | `.harness/state/feature_list.json` |
| `feature_list.schema.json` | `.harness/state/feature_list.schema.json` |
| `session-handoff.md` | `.harness/state/session-handoff.md` |
| `logs/progress-log.md` | `.harness/logs/progress-log.md` |
| `docs/decision-log.md` | `.harness/decisions/decision-log.md` |
| `checklists/` | `.harness/checklists/` |
| `skills/` | `.harness/skills/` |
| `projects/` | `src/`、`apps/` 或 `packages/` |

## 迁移后要检查

- `AGENTS.md` 是否使用 `.harness/...` 新路径。
- `CLAUDE.md` 是否使用 `.harness/...` 新路径。
- README 和使用文档是否使用 `sh init.sh`。
- 旧根目录文件是否已经删除。
