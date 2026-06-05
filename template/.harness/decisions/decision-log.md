# Decision Log

> 用途：记录项目中的重要技术决策、产品取舍、Agent 执行边界和验证依据。

## Decision Status

- `PROPOSED`：已提出，等待确认。
- `ACCEPTED`：已采纳，后续实现应遵循。
- `REJECTED`：已拒绝，保留原因。
- `SUPERSEDED`：已被新决策替代。

## Decisions

### D-20260606-001 - 使用 `.harness/` 分离 Agent 管理文件

- 状态：ACCEPTED
- 日期：2026-06-06
- 决策人：AI_AGENT + HUMAN_REVIEW

#### Context

项目业务文档和 Agent 工作流文件混放会导致查找困难。为了区分项目本身和 Agent 管理机制，决定将 Agent 状态、日志、决策和检查清单统一放入 `.harness/`。

#### Decision

最终选择：使用 `.harness/` 作为 AI Agent Harness 专用目录。

#### Consequences

正面影响：
- `docs/` 只保留项目业务文档。
- Agent 状态文件集中管理，更容易查找。

负面影响 / 代价：
- Agent 规则中的路径需要统一改为 `.harness/...`。
