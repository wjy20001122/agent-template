#!/usr/bin/env sh

# validate-template.sh

# 校验模板仓库的基础可用性。
# 用法：sh scripts/validate-template.sh

set -eu

# SCRIPT_DIR：当前校验脚本所在目录。
# REPO_ROOT：模板仓库根目录。
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"

# TMP_ROOT：用于生成临时项目的目录。
# 使用当前目录下的 .validate-tmp，避免污染模板内容。
TMP_ROOT="$REPO_ROOT/.validate-tmp"
GENERATED_PROJECT="$TMP_ROOT/generated-project"

cleanup() {
  # 关键步骤：校验结束后清理临时目录，避免污染用户工作区。
  rm -rf "$TMP_ROOT"
}
trap cleanup EXIT INT TERM

assert_file_exists() {
  # file_path：必须存在的文件路径。
  file_path="$1"

  if [ ! -f "$file_path" ]; then
    echo "[validate] 缺少必要文件：$file_path"
    exit 1
  fi
}

echo "[validate] 1/5 检查必要文件"
assert_file_exists "$REPO_ROOT/README.md"
assert_file_exists "$REPO_ROOT/scripts/create-project.sh"
assert_file_exists "$REPO_ROOT/template/init.sh"
assert_file_exists "$REPO_ROOT/template/AGENTS.md"
assert_file_exists "$REPO_ROOT/template/CLAUDE.md"
assert_file_exists "$REPO_ROOT/template/.harness/state/feature_list.json"
assert_file_exists "$REPO_ROOT/template/.harness/state/feature_list.schema.json"

echo "[validate] 2/5 检查 shell 语法"
sh -n "$REPO_ROOT/scripts/create-project.sh"
sh -n "$REPO_ROOT/scripts/validate-template.sh"
sh -n "$REPO_ROOT/template/init.sh"

echo "[validate] 3/5 检查 JSON 合法性"
python3 - "$REPO_ROOT" <<'PYCODE'
import json
import pathlib
import sys

# repo_root：模板仓库根目录，用于定位需要校验的 JSON 文件。
repo_root = pathlib.Path(sys.argv[1])

# json_files：当前模板中必须保持合法 JSON 的文件清单。
json_files = [
    repo_root / "template/.harness/state/feature_list.json",
    repo_root / "template/.harness/state/feature_list.schema.json",
]

for json_file in json_files:
    # 关键步骤：逐个加载 JSON，加载失败会抛出异常并让校验脚本退出。
    with json_file.open("r", encoding="utf-8") as file_obj:
        json.load(file_obj)
    print(f"[validate] JSON OK: {json_file}")
PYCODE

echo "[validate] 4/5 生成临时项目"
rm -rf "$TMP_ROOT"
mkdir -p "$TMP_ROOT"
sh "$REPO_ROOT/scripts/create-project.sh" "$GENERATED_PROJECT"

# 关键步骤：进入生成后的项目运行 init.sh，验证模板落地后的初始化流程。
cd "$GENERATED_PROJECT"
sh init.sh

echo "[validate] 5/5 检查生成结果"
assert_file_exists "$GENERATED_PROJECT/README.md"
assert_file_exists "$GENERATED_PROJECT/AGENTS.md"
assert_file_exists "$GENERATED_PROJECT/CLAUDE.md"
assert_file_exists "$GENERATED_PROJECT/.env.example"
assert_file_exists "$GENERATED_PROJECT/.gitignore"
assert_file_exists "$GENERATED_PROJECT/.harness/state/feature_list.json"

# 关键步骤：确认自动项目名替换生效，避免生成项目仍保留 {{PROJECT_NAME}}。
if grep -q '{{PROJECT_NAME}}' "$GENERATED_PROJECT/README.md" "$GENERATED_PROJECT/CLAUDE.md" "$GENERATED_PROJECT/.harness/state/feature_list.json"; then
  echo "[validate] 项目名占位符未完全替换"
  exit 1
fi

echo "[validate] 全部通过"
