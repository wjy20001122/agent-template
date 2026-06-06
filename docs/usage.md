# Usage Guide

## 1. 新建项目

```bash
git clone https://github.com/wjy20001122/agent-template.git
cd agent-template
sh scripts/create-project.sh my-new-project
cd my-new-project
sh init.sh
```

或者直接复制模板：

```bash
cp -r template my-new-project
cd my-new-project
sh init.sh
```

## 2. 新项目优先填写顺序

1. `README.md`：写项目介绍。
2. `AGENTS.md`：写通用 Agent 规则。
3. `CLAUDE.md`：写 Claude Code 项目上下文。
4. `docs/requirements.md`：写需求、范围和验收标准。
5. `.harness/state/feature_list.json`：拆分功能和状态。
6. `.harness/state/session-handoff.md`：记录当前会话状态。

## 3. 生成后建议替换的占位符

创建项目后，建议优先搜索并替换以下占位符：

- `{{PROJECT_NAME}}`：项目名称，`create-project.sh` 会自动替换基础位置。
- `{{ONE_SENTENCE_GOAL}}`：一句话项目目标。
- `{{PROJECT_MISSION}}`：给通用 Agent 读取的项目使命。
- `{{INSTALL_COMMAND}}`：安装依赖命令。
- `{{RUN_COMMAND}}`：本地运行命令。
- `{{TEST_COMMAND}}`：测试命令。
- `{{LINT_COMMAND}}`：格式化或 lint 命令。
- `{{TYPECHECK_COMMAND}}`：类型检查命令。
- `{{OWNER}}`：负责人。
- `{{YYYY-MM-DD}}`：日期。

建议替换后再让 Agent 开始编码，避免 Agent 把模板占位符误认为真实需求。

## 4. Agent 启动读取顺序

1. `AGENTS.md`
2. `CLAUDE.md`
3. `.harness/state/session-handoff.md`
4. `.harness/state/feature_list.json`
5. `.harness/logs/progress-log.md`
6. `.harness/decisions/decision-log.md`
7. `docs/requirements.md`
8. 当前 feature 相关源码、测试和文档

## 5. 任务结束前必须更新

- `.harness/state/feature_list.json`
- `.harness/logs/progress-log.md`
- `.harness/state/session-handoff.md`
- 如有重要技术或产品决策：`.harness/decisions/decision-log.md`

## 6. 推荐 Agent 指令

```text
请基于当前 Harness 工作流实现 F-001。
要求：
1. 先阅读 AGENTS.md、CLAUDE.md、.harness/state/session-handoff.md、.harness/state/feature_list.json、.harness/logs/progress-log.md、.harness/decisions/decision-log.md。
2. 只处理 F-001。
3. 先给实现计划，不要直接改代码。
4. 完成后运行验证命令。
5. 更新 feature_list、progress-log、session-handoff。
6. 如有重要决策，更新 decision-log。
```

## 7. 注意

`scripts/create-project.sh` 和 `template/init.sh` 都使用 POSIX `sh` 写法，推荐用 `sh` 执行，避免最小 Linux 环境没有 Bash 时失败。

## 8. 模板维护者校验

如果你修改了模板仓库自身内容，建议在提交前运行：

```bash
sh scripts/validate-template.sh
```

该脚本会完成以下检查：

1. 必要文件是否存在。
2. Shell 脚本语法是否正确。
3. JSON 文件是否合法。
4. 是否可以正常生成新项目。
5. 生成项目后是否可以运行 `sh init.sh`。
