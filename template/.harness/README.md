# .harness

这里存放 AI Agent 工作流相关文件，不放业务文档和源码。

## 目录说明

```text
.harness/
├── state/       # 功能状态和会话交接
├── logs/        # 进度日志
├── decisions/   # 决策记录
├── checklists/  # 实现前、提交前、复查清单
├── skills/      # 可复用 Agent Skill / Prompt / SOP
└── templates/   # 可复制的记录模板
```

## 原则

- 项目业务文档放 `docs/`。
- Agent 状态和流程记录放 `.harness/`。
- 每次任务结束前更新 state、logs，必要时更新 decisions。
