# Deployment

> 用途：记录部署环境、配置、发布步骤和回滚方式。

## 1. Environments

| 环境 | 地址 | 用途 | 负责人 |
|---|---|---|---|
| local | `localhost` | 本地开发 | {{OWNER}} |
| dev | {{DEV_URL}} | 测试环境 | {{OWNER}} |
| prod | {{PROD_URL}} | 生产环境 | {{OWNER}} |

## 2. Required Environment Variables

| 变量名 | 说明 | 示例 | 是否敏感 |
|---|---|---|---|
| APP_ENV | 运行环境 | development | 否 |
| DATABASE_URL | 数据库连接 | 不要填写真实值 | 是 |

## 3. Local Run

```bash
{{INSTALL_COMMAND}}
{{RUN_COMMAND}}
```

## 4. Deploy Steps

1. 运行测试：`{{TEST_COMMAND}}`
2. 构建产物：`{{BUILD_COMMAND}}`
3. 部署：`{{DEPLOY_COMMAND}}`
4. 健康检查：`{{HEALTH_CHECK_COMMAND}}`

## 5. Rollback

```bash
{{ROLLBACK_COMMAND}}
```

## 6. Release Checklist

- [ ] 测试通过。
- [ ] 文档已更新。
- [ ] 环境变量已确认。
- [ ] 回滚方案已确认。
