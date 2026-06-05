# CLAUDE.md

> 作用：给 Claude Code / Claude 类编码代理读取的项目级上下文。保持简洁、可执行、可长期维护。

## 1. Project Overview

- 项目名称：{{PROJECT_NAME}}
- 一句话目标：{{ONE_SENTENCE_GOAL}}
- 当前阶段：{{IDEA | SPEC | MVP | ITERATION | PRODUCTION}}
- 主要用户：{{TARGET_USERS}}
- 成功标准：{{SUCCESS_METRICS}}

## 2. Tech Stack

- Language：{{Python / TypeScript / Java / Go / ...}}
- Backend：{{FastAPI / Django / Express / Spring Boot / ...}}
- Frontend：{{React / Vue / Next.js / ...}}
- Database：{{PostgreSQL / MySQL / SQLite / MongoDB / ...}}
- Package Manager：{{uv / pip / pnpm / npm / maven / ...}}
- Test：{{pytest / vitest / jest / junit / ...}}

## 3. Repository Structure

```text
src/                         # 单体项目源码
apps/                        # 多应用项目，例如 web / api / worker
packages/                    # 公共包或 SDK
tests/                       # 测试代码
scripts/                     # 项目脚本
docs/                        # 项目业务文档
.harness/                    # AI Agent 工作流、状态、日志、决策、检查清单
AGENTS.md                    # 通用 Agent 规则
CLAUDE.md                    # Claude Code 项目上下文
init.sh                      # 初始化脚本
```

## 4. Harness Workflow

1. 先阅读：`AGENTS.md`、`CLAUDE.md`、`.harness/state/session-handoff.md`、`.harness/state/feature_list.json`、最新 `.harness/logs/progress-log.md`。
2. 只选择一个未完成 feature。
3. 修改代码前先说明计划；涉及重要设计时先给 2-3 个方案。
4. 实现后运行验证命令。
5. 每完成一个功能：更新 `.harness/state/feature_list.json`、`.harness/logs/progress-log.md`、`.harness/state/session-handoff.md`。
6. 涉及重要技术取舍时，更新 `.harness/decisions/decision-log.md`。

## 5. Commands

```bash
# 初始化项目
sh init.sh

# 安装依赖
{{INSTALL_COMMAND}}

# 本地运行
{{RUN_COMMAND}}

# 测试
{{TEST_COMMAND}}

# 格式化 / lint
{{LINT_COMMAND}}

# 类型检查
{{TYPECHECK_COMMAND}}
```

## 6. Coding Rules

- 优先简单、清晰、可测试，不要过度设计。
- 新增函数必须说明输入、输出、异常情况。
- 修改公共接口时同步更新 `docs/api.md`。
- 不要提交密钥、token、私有配置；使用 `.env.example`。
- 遇到不确定需求时，先提问，不要默认假设。
- 所有代码必须包含必要注释，关键逻辑要写中文注释说明。

## 7. Documentation Rules

- 需求变化：更新 `docs/requirements.md`。
- 架构变化：更新 `docs/architecture.md`。
- 接口变化：更新 `docs/api.md`。
- 部署变化：更新 `docs/deployment.md`。
- 排障经验：更新 `docs/troubleshooting.md`。
- 重要决策：更新 `.harness/decisions/decision-log.md`。

## 8. Definition of Done

- 功能可运行。
- 有必要测试或手动验证步骤。
- 文档同步更新。
- `.harness/state/feature_list.json` 状态更新。
- `.harness/logs/progress-log.md` 记录本次变更。
- `.harness/state/session-handoff.md` 记录下一步。
