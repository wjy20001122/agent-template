#!/usr/bin/env bash

# 从 template/ 复制一份新项目。
# 用法：bash scripts/create-project.sh my-new-project

set -euo pipefail

PROJECT_NAME="${1:-}"

if [ -z "$PROJECT_NAME" ]; then
  echo "用法：bash scripts/create-project.sh <project-name>"
  exit 1
fi

if [ -e "$PROJECT_NAME" ]; then
  echo "错误：目标目录已存在：$PROJECT_NAME"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cp -R "$REPO_ROOT/template" "$PROJECT_NAME"

echo "[create-project] 已创建：$PROJECT_NAME"
echo "[create-project] 下一步："
echo "  cd $PROJECT_NAME"
echo "  bash init.sh"
echo "  修改 AGENTS.md / CLAUDE.md / docs/requirements.md / .harness/state/feature_list.json"
