# Agent Template

> 一个轻量级 AI Agent Harness 新项目模板。
>
> 核心目标：把 **模板仓库自身内容** 和 **新项目模板内容** 分开，把 **项目业务文档** 和 **Agent 工作流状态** 分开，避免目录混乱。

## 目录结构

```text
agent-template/
├── README.md                    # 说明这个模板怎么用
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
├── examples/                     # 示例项目
│   └── basic/
├── docs/                         # 模板自身说明文档
│   ├── design.md
│   └── usage.md
└── scripts/
    ├── create-project.sh
    └── validate-template.sh
```

## 快速开始

```bash
git clone https://github.com/wjy20001122/agent-template.git
cd agent-template
sh scripts/create-project.sh my-new-project
cd my-new-project
sh init.sh
```

也可以直接复制模板目录：

```bash
cp -r template my-new-project
cd my-new-project
sh init.sh
```

## 生成后的项目结构

```text
my-new-project/
├── README.md
├── AGENTS.md
├── CLAUDE.md
├── init.sh
├── src/                         # 单体项目源码
├── apps/                        # 多应用项目，例如 web / api / worker
├── packages/                    # 公共包 / SDK / 共享模块
├── tests/                       # 测试代码
├── scripts/                     # 项目脚本
├── docs/                        # 项目业务文档
└── .harness/                    # AI Agent 工作流、状态、日志、决策、检查清单
```

## 分层原则

- `template/`：真正复制到新项目里的内容。
- `docs/`：本模板仓库自身的设计、使用说明。
- `examples/`：示例项目。
- `scripts/`：模板仓库工具脚本。
- `template/docs/`：新项目自己的业务文档。
- `template/.harness/`：新项目里的 Agent Harness 管理区。

## 模板校验

修改模板后，建议运行：

```bash
sh scripts/validate-template.sh
```

该命令会检查必要文件、Shell 语法、JSON 合法性，并实际生成一个临时项目执行 `init.sh`。

## 详细文档

- [使用教程](docs/usage.md)
- [设计说明](docs/design.md)

## 给 Agent 的推荐启动指令

```text
请先阅读 AGENTS.md、CLAUDE.md、.harness/state/session-handoff.md、.harness/state/feature_list.json、.harness/logs/progress-log.md、.harness/decisions/decision-log.md、docs/requirements.m[...]
然后只选择一个 TODO feature，先给实现计划，不要直接改代码。
```

> Prompt 让 Agent 开始工作，Harness 让 Agent 可靠完成工作。
