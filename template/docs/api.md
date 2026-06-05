# API Documentation

> 用途：记录接口契约。修改公共接口时必须同步更新本文档。

## 1. Conventions

- Base URL：`{{BASE_URL}}`
- Auth：{{AUTH_METHOD}}
- Content-Type：`application/json`
- Error Format：统一错误响应格式

## 2. Error Response

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "错误说明",
    "details": {}
  }
}
```

## 3. Endpoints

### {{METHOD}} {{PATH}}

说明：{{DESCRIPTION}}

#### Request

```json
{
  "field": "value"
}
```

#### Response

```json
{
  "data": {}
}
```

#### Validation

- 正常情况：{{EXPECTED_RESULT}}
- 异常情况：{{ERROR_CASE}}
