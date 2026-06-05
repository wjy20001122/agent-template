# Agent Review Checklist

用于人工或另一个 Agent 复查本次改动。

## Scope

- [ ] 是否只处理了一个明确 feature？
- [ ] 是否有无关文件改动？
- [ ] 是否有过度设计？

## Correctness

- [ ] 核心逻辑是否符合需求？
- [ ] 异常输入是否有处理？
- [ ] 边界条件是否考虑？

## Maintainability

- [ ] 命名是否清晰？
- [ ] 函数是否职责单一？
- [ ] 复杂逻辑是否有中文注释？

## Documentation

- [ ] docs 是否同步更新？
- [ ] decision-log 是否记录重要取舍？
- [ ] progress-log 是否记录本次进展？

## Security

- [ ] 是否泄露密钥？
- [ ] 外部请求 / 文件删除 / 权限变更是否经过确认？
