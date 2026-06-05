# {{PROJECT_NAME}}

{{ONE_SENTENCE_GOAL}}

## Quick Start

```bash
bash init.sh
{{INSTALL_COMMAND}}
{{RUN_COMMAND}}
```

## Project Structure

```text
src/                         # 单体项目源码
apps/                        # 多应用项目，例如 web / api / worker
packages/                    # 公共包或 SDK
tests/                       # 测试代码
scripts/                     # 项目脚本
docs/                        # 项目业务文档
.harness/                    # AI Agent 工作流、状态、日志、决策、检查清单
```

## Agent Start

让 AI Agent 开始任务时，建议使用：

```text
请先阅读 AGENTS.md、CLAUDE.md、.harness/state/session-handoff.md、.harness/state/feature_list.json、.harness/logs/progress-log.md、.harness/decisions/decision-log.md、docs/requirements.md。
然后只选择一个 TODO feature，先给实现计划，不要直接改代码。
```
