#!/usr/bin/env sh

# 从 template/ 复制一份新项目。
# 用法：sh scripts/create-project.sh my-new-project

set -eu

PROJECT_NAME="${1:-}"

if [ -z "$PROJECT_NAME" ]; then
  echo "用法：sh scripts/create-project.sh <project-name>"
  exit 1
fi

if [ -e "$PROJECT_NAME" ]; then
  echo "错误：目标目录已存在：$PROJECT_NAME"
  exit 1
fi

# 说明：
# 这里使用 POSIX sh 兼容写法，不依赖 Bash 的 BASH_SOURCE。
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"

cp -R "$REPO_ROOT/template" "$PROJECT_NAME"

echo "[create-project] 已创建：$PROJECT_NAME"
echo "[create-project] 下一步："
echo "  cd $PROJECT_NAME"
echo "  sh init.sh"
echo "  修改 AGENTS.md / CLAUDE.md / docs/requirements.md / .harness/state/feature_list.json"
