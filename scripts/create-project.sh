#!/usr/bin/env sh

# 从 template/ 复制一份新项目。
# 用法：sh scripts/create-project.sh my-new-project
# 也支持传入路径：sh scripts/create-project.sh ./projects/my-new-project

set -eu

# 依赖检查：当前脚本使用 python3 做占位符替换。
# 说明：不用 sed 是为了避免项目名包含特殊字符时出现跨平台转义问题。
if ! command -v python3 >/dev/null 2>&1; then
  echo "错误：create-project.sh 需要 python3，用于安全替换模板占位符。"
  echo "请先安装 python3 后重试。"
  exit 1
fi

# TARGET_DIR：用户希望创建的新项目目录，可以是相对路径，也可以是绝对路径。
TARGET_DIR="${1:-}"

if [ -z "$TARGET_DIR" ]; then
  echo "用法：sh scripts/create-project.sh <project-name-or-path>"
  exit 1
fi

if [ -e "$TARGET_DIR" ]; then
  echo "错误：目标目录已存在：$TARGET_DIR"
  exit 1
fi

# 说明：
# 这里使用 POSIX sh 兼容写法，不依赖 Bash 的 BASH_SOURCE。
# SCRIPT_DIR：当前脚本所在目录。
# REPO_ROOT：模板仓库根目录，用于定位 template/。
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"

# PROJECT_NAME：从目标目录中提取项目名。
# 例如 TARGET_DIR=./projects/my-app 时，PROJECT_NAME=my-app。
PROJECT_NAME="$(basename -- "$TARGET_DIR")"

# TARGET_PARENT：目标目录的父目录。
# 关键步骤：当用户传入 ./projects/my-app 这类路径时，先创建父目录。
TARGET_PARENT="$(dirname -- "$TARGET_DIR")"
if [ "$TARGET_PARENT" != "." ] && [ ! -d "$TARGET_PARENT" ]; then
  mkdir -p "$TARGET_PARENT"
fi

# 复制模板目录作为新项目起点。
cp -R "$REPO_ROOT/template" "$TARGET_DIR"

# replace_in_file 函数：在文件存在时执行简单占位符替换。
# 参数 $1：要处理的文件路径。
# 参数 $2：要查找的占位符文本。
# 参数 $3：要替换成的新文本。
replace_in_file() {
  # file_path：当前要替换内容的目标文件。
  file_path="$1"
  # search_text：模板中的占位符，例如 {{PROJECT_NAME}}。
  search_text="$2"
  # replacement_text：替换后的真实内容，例如 my-app。
  replacement_text="$3"

  # 关键步骤：只处理真实存在的文件，避免不同模板版本下缺文件导致脚本失败。
  if [ -f "$file_path" ]; then
    # 关键步骤：使用 Python 处理替换，避免 sed 在不同系统上对转义字符的兼容性问题。
    python3 - "$file_path" "$search_text" "$replacement_text" <<'PYCODE'
import pathlib
import sys

# path_arg：要修改的文件路径。
# search_arg：要查找的模板占位符。
# replacement_arg：替换后的项目名。
path_arg = pathlib.Path(sys.argv[1])
search_arg = sys.argv[2]
replacement_arg = sys.argv[3]

# 读取文本时显式使用 UTF-8，保证中文模板内容在不同环境中行为一致。
content = path_arg.read_text(encoding="utf-8")

# 将模板占位符替换为用户传入的项目名。
content = content.replace(search_arg, replacement_arg)

# 写回文件，保持 UTF-8 编码。
path_arg.write_text(content, encoding="utf-8")
PYCODE
  fi
}

# 自动替换最基础的项目名占位符，降低新项目初始化后的手动修改成本。
replace_in_file "$TARGET_DIR/README.md" "{{PROJECT_NAME}}" "$PROJECT_NAME"
replace_in_file "$TARGET_DIR/CLAUDE.md" "{{PROJECT_NAME}}" "$PROJECT_NAME"
replace_in_file "$TARGET_DIR/.harness/state/feature_list.json" "{{PROJECT_NAME}}" "$PROJECT_NAME"

echo "[create-project] 已创建：$TARGET_DIR"
echo "[create-project] 已自动替换项目名：$PROJECT_NAME"
echo "[create-project] 下一步："
echo "  cd $TARGET_DIR"
echo "  sh init.sh"
echo "  修改 AGENTS.md / CLAUDE.md / docs/requirements.md / .harness/state/feature_list.json"
