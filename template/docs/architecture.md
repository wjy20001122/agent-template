# Architecture

> 用途：描述系统结构、模块边界、数据流和关键设计取舍。

## 1. System Goal

{{SYSTEM_GOAL}}

## 2. High-level Architecture

```text
{{CLIENT}} -> {{API_LAYER}} -> {{SERVICE_LAYER}} -> {{DATABASE_OR_EXTERNAL_SERVICE}}
```

## 3. Modules

| 模块 | 职责 | 输入 | 输出 | 依赖 |
|---|---|---|---|---|
| {{MODULE_NAME}} | {{RESPONSIBILITY}} | {{INPUT}} | {{OUTPUT}} | {{DEPENDENCY}} |

## 4. Data Flow

1. 步骤 1：{{STEP}}
2. 步骤 2：{{STEP}}
3. 步骤 3：{{STEP}}

## 5. Key Design Decisions

重要决策必须同步记录到 `.harness/decisions/decision-log.md`。

| 决策 ID | 标题 | 状态 |
|---|---|---|
| D-{{YYYYMMDD}}-001 | {{TITLE}} | PROPOSED |

## 6. Risks

| 风险 | 影响 | 缓解方式 |
|---|---|---|
| {{RISK}} | {{IMPACT}} | {{MITIGATION}} |
