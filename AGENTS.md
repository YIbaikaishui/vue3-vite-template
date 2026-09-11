# AGENTS.md — vue3-vite-template

Vue 3 + Vite + Tailwind CSS 4 + shadcn-vue 前端（`web/`）+ FastAPI 后端（`app/`）全栈模板。
Agent 克隆本仓库后，按下面的步骤把项目跑起来再开始开发。

## 启动步骤

一键安装前后端依赖：`make setup`（等价于 `pnpm --dir web install` + `uv sync`）

- **前端**：`make web` → <http://localhost:5173>（Vite dev server，热更新）
- **后端**：`make api` → <http://localhost:8000>（FastAPI + uvicorn --reload）
- **同时跑**：`make dev`
- 后端 API 文档：<http://localhost:8000/docs>

## 常用命令

| 场景 | 命令 |
|---|---|
| 前端类型检查（提交前必须过） | `make typecheck`（vue-tsc） |
| 前端构建 | `make build` |
| 后端 lint（ruff） | `make lint` |
| 后端格式化 | `make format` |
| 全部安装 | `make setup` |

## 写代码约定

- **前端**（`web/src/`）：Vue 3 Composition API + `<script setup lang="ts">`，状态用 Pinia，请求用 `axios`，样式用 Tailwind 4 + shadcn-vue 组件（`components.json`）
- **后端**（`app/`）：FastAPI + uv 管理 Python 依赖（改依赖后 `uv sync`，不要手改 `uv.lock`）
- **新页面**：`web/src/views/` + 在 router 里注册路由；新组件放 `web/src/components/`
- **提交前**：`make typecheck && make lint` 全绿
