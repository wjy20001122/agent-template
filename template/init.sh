#!/usr/bin/env sh

# 说明：
# 初始化一个 AI Agent 友好的项目结构。
# 注意：脚本只在文件不存在时创建，避免覆盖已有内容。
# 该脚本使用 POSIX sh 写法，尽量不依赖 Bash，方便在最小 Linux 环境中运行。

set -eu

PROJECT_ROOT="$(pwd)"

echo "[init] 初始化项目目录：${PROJECT_ROOT}"

mkdir -p src apps packages tests scripts docs
mkdir -p .harness/state .harness/logs .harness/decisions .harness/checklists .harness/skills .harness/templates

touch src/.gitkeep apps/.gitkeep packages/.gitkeep tests/.gitkeep scripts/.gitkeep

create_if_missing() {
  file_path="$1"
  content="$2"

  if [ ! -f "$file_path" ]; then
    printf "%s\n" "$content" > "$file_path"
  fi
}

create_if_missing ".env.example" "# 示例环境变量，不要写真实密钥
APP_ENV=development
APP_PORT=8000
DATABASE_URL=
API_KEY="

create_if_missing ".gitignore" "# secrets
.env
*.pem
*.key

# system
.DS_Store
Thumbs.db

# logs
*.log

# python
__pycache__/
.pytest_cache/
.venv/

# node
node_modules/
dist/
build/

# ide
.vscode/
.idea/"

create_if_missing "docs/requirements.md" "# Requirements

## Background

## Users

## Functional Requirements

## Non-functional Requirements

## Open Questions"

create_if_missing "docs/architecture.md" "# Architecture

## System Goal

## High-level Architecture

## Modules

## Data Flow

## Key Design Decisions

## Risks"

create_if_missing "docs/api.md" "# API Documentation

## Conventions

## Error Response

## Endpoints"

create_if_missing "docs/deployment.md" "# Deployment

## Environments

## Required Environment Variables

## Local Run

## Deploy Steps

## Rollback"

create_if_missing "docs/troubleshooting.md" "# Troubleshooting

## Quick Diagnosis

## Known Issues"

create_if_missing ".harness/logs/progress-log.md" "# Progress Log

## {{YYYY-MM-DD}}

### Done
- 初始化项目结构。

### Decisions
- 使用 AGENTS.md + CLAUDE.md + .harness 管理 AI Coding Agent 上下文。

### Next
- 补充需求文档和 .harness/state/feature_list.json。

### Blockers
- 暂无。"

create_if_missing ".harness/state/session-handoff.md" "# Session Handoff

## Current State

## What Was Done

## Files Changed

## Decisions Made

## Validation Evidence

## Known Issues / Blockers

## Next Recommended Steps"

create_if_missing ".harness/decisions/decision-log.md" "# Decision Log

## Decisions

### D-{{YYYYMMDD}}-001 - {{DECISION_TITLE}}

- 状态：{{PROPOSED | ACCEPTED | REJECTED | SUPERSEDED}}
- 日期：{{YYYY-MM-DD}}

#### Context

#### Options Considered

#### Decision

#### Consequences

#### Validation

#### Follow-up"

echo "[init] 完成。建议下一步："
echo "1. 修改 AGENTS.md / CLAUDE.md 中的占位符"
echo "2. 编写 docs/requirements.md"
echo "3. 在 .harness/state/feature_list.json 中拆分功能"
echo "4. 开始最小可运行版本"
echo "5. 每次会话结束前更新 .harness/state/session-handoff.md"
