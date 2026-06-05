# Agent Template

> 一个简洁的 AI Agent 项目启动模板。

本仓库采用清晰分层：`template/`、`docs/`、`examples/`、`scripts/` 分开存放，避免模板说明和新项目内容混在一起。

## 目录结构

```text
agent-template/
├── README.md
├── template/                     # 真正会复制到新项目里的模板内容
│   ├── AGENTS.md
│   ├── CLAUDE.md
│   ├── init.sh
│   ├── src/
│   ├── apps/
│   ├── packages/
│   ├── tests/
│   ├── scripts/
│   ├── docs/
│   └── .harness/
├── examples/
│   └── basic/
├── docs/
│   ├── design.md
│   ├── usage.md
│   └── migration.md
└── scripts/
    └── create-project.sh
```

## 快速开始

```bash
git clone https://github.com/wjy20001122/agent-template.git
cd agent-template
bash scripts/create-project.sh my-new-project
cd my-new-project
bash init.sh
```

## 生成后的新项目结构

```text
my-new-project/
├── README.md
├── AGENTS.md
├── CLAUDE.md
├── init.sh
├── src/
├── apps/
├── packages/
├── tests/
├── scripts/
├── docs/
└── .harness/
```

## 推荐 Agent 启动指令

```text
请先阅读 AGENTS.md、CLAUDE.md、.harness/state/session-handoff.md、.harness/state/feature_list.json、.harness/logs/progress-log.md、.harness/decisions/decision-log.md、docs/requirements.md。
然后只选择一个 TODO feature，先给实现计划，不要直接改代码。
```
