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

## 3. Agent 启动读取顺序

1. `AGENTS.md`
2. `CLAUDE.md`
3. `.harness/state/session-handoff.md`
4. `.harness/state/feature_list.json`
5. `.harness/logs/progress-log.md`
6. `.harness/decisions/decision-log.md`
7. `docs/requirements.md`
8. 当前 feature 相关源码、测试和文档

## 4. 任务结束前必须更新

- `.harness/state/feature_list.json`
- `.harness/logs/progress-log.md`
- `.harness/state/session-handoff.md`
- 如有重要技术或产品决策：`.harness/decisions/decision-log.md`

## 5. 推荐 Agent 指令

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

## 6. 注意

`scripts/create-project.sh` 和 `template/init.sh` 都使用 POSIX `sh` 写法，推荐用 `sh` 执行，避免最小 Linux 环境没有 Bash 时失败。
