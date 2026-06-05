# Design Notes

## 1. 为什么要这样设计？

普通模板常把业务文档、Agent 状态、脚本、示例项目都放在根目录。真实项目开发一段时间后，会很难判断：

- 哪些文件属于模板仓库自身？
- 哪些文件会复制到新项目？
- 哪些是项目业务文档？
- 哪些是 Agent 的执行状态和交接记录？

因此本模板采用两层分离：

1. 模板仓库自身：`README.md`、`docs/`、`examples/`、`scripts/`。
2. 新项目模板内容：`template/`。

新项目内部再分为：

1. 项目业务内容：`src/`、`apps/`、`packages/`、`tests/`、`docs/`。
2. Agent Harness 内容：`.harness/`。

## 2. 新项目目录原则

```text
docs/         # 项目业务文档
.harness/     # Agent 工作流、状态、日志、决策、检查清单
```

这样查找文件时更明确：

| 想找什么 | 去哪里 |
|---|---|
| 项目需求 | `docs/requirements.md` |
| 项目架构 | `docs/architecture.md` |
| 功能状态 | `.harness/state/feature_list.json` |
| 会话交接 | `.harness/state/session-handoff.md` |
| 进度日志 | `.harness/logs/progress-log.md` |
| 重要决策 | `.harness/decisions/decision-log.md` |
| Agent 检查清单 | `.harness/checklists/` |

## 3. 代码目录设计

- `src/`：单体项目默认源码目录。
- `apps/`：多应用项目，例如 web、api、worker。
- `packages/`：公共包、SDK、共享模块。
- `tests/`：测试代码。
- `scripts/`：项目级脚本。

## 4. Harness 五个子系统

```text
Instructions：AGENTS.md / CLAUDE.md / docs/
State：.harness/state/feature_list.json / session-handoff.md
Verification：init.sh / .harness/checklists / tests / lint / type-check
Scope：一次只做一个 feature
Lifecycle：开始读取上下文，结束写入进度和交接
```
