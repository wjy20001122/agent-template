# AGENTS.md

> 作用：给所有 AI Coding Agent 的通用项目说明。可以被 Claude Code、Copilot、Codex、Cursor 等工具复用。

## Project Mission

{{PROJECT_MISSION}}

## Agent Operating Principles

1. 先理解需求，再改代码。
2. 重要改动必须先给计划。
3. 不清楚就提问，不要臆测。
4. 尽量小步提交、小步验证。
5. 所有新增代码要有清晰注释，复杂逻辑必须解释原因。
6. 一次只处理一个 feature，避免任务扩散。

## Harness Start Sequence

每次开始任务前，按顺序读取：

1. `AGENTS.md`
2. `CLAUDE.md`
3. `.harness/state/session-handoff.md`
4. `.harness/state/feature_list.json`
5. `.harness/logs/progress-log.md`
6. `.harness/decisions/decision-log.md`
7. `docs/requirements.md`
8. 与当前 feature 相关的源码 / 测试 / 文档

## Repository Map

- `src/`：单体项目源码。
- `apps/`：多应用项目，例如 web / api / worker。
- `packages/`：公共包、SDK、共享模块。
- `tests/`：测试代码。
- `scripts/`：项目级脚本。
- `docs/`：项目业务文档。
- `.harness/`：AI Agent 工作流、状态、日志、决策和检查清单。

## Before Editing

- 阅读相关代码和文档。
- 确认目标文件和影响范围。
- 如果需求不完整，向用户提出具体问题。
- 修改代码前先给简短计划。

## Code Style

- 命名要表达业务含义。
- 单个函数只做一件事。
- 避免隐藏副作用。
- 错误处理要明确。
- 不要吞掉异常。
- 新增代码必须有必要注释，复杂逻辑必须写中文注释。

## Testing Guidance

- 优先补充最靠近业务逻辑的单元测试。
- 修 bug 时先补失败用例，再修复。
- 测试命令：`{{TEST_COMMAND}}`
- 如果无法运行测试，必须说明原因和人工验证方式。

## Security Boundaries

- 禁止读取或输出真实密钥。
- 禁止把 `.env`、token、cookie、私钥提交到仓库。
- 外部请求、删除文件、批量迁移前必须说明风险。
- 涉及生产环境、付费资源、权限变更时必须先获得用户确认。

## Documentation Tracking

发生以下变化时必须更新对应文档：

- 需求变化：`docs/requirements.md`
- 架构变化：`docs/architecture.md`
- 接口变化：`docs/api.md`
- 部署变化：`docs/deployment.md`
- 排障经验：`docs/troubleshooting.md`
- 重要决策：`.harness/decisions/decision-log.md`

## Progress Tracking

每次完成任务后更新：

- `.harness/state/feature_list.json`
- `.harness/logs/progress-log.md`
- `.harness/state/session-handoff.md`

## Definition of Done

- 功能可运行或明确说明阻塞原因。
- 验收标准已满足。
- 已运行测试 / lint / type-check，或说明无法运行原因。
- 文档同步更新。
- `.harness/state/feature_list.json` 状态更新。
- `.harness/logs/progress-log.md` 记录本次变更。
- `.harness/state/session-handoff.md` 写好下一步。
