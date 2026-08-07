SHELL := /bin/bash
PNPM  := pnpm
UV    := uv

WEB_DIR  := web
APP_DIR  := app

.PHONY: help setup install api web dev build lint typecheck format clean

help: ## Show available targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-14s\033[0m %s\n", $$1, $$2}'

setup: install sync ## Install all dependencies (frontend + backend)

install: ## Install frontend dependencies
	$(PNPM) --dir $(WEB_DIR) install

sync: ## Sync backend dependencies
	$(UV) sync

api: ## Run the backend (FastAPI) dev server
	$(UV) run uvicorn app.main:app --reload --port 8000

web: ## Run the frontend (Vite) dev server
	$(PNPM) --dir $(WEB_DIR) dev

dev: ## Run frontend + backend dev servers
	$(MAKE) api & $(MAKE) web

build: ## Build the frontend for production
	$(PNPM) --dir $(WEB_DIR) build

lint: ## Lint backend (ruff)
	$(UV) run ruff check $(APP_DIR)

typecheck: ## Type-check frontend (vue-tsc)
	$(PNPM) --dir $(WEB_DIR) exec vue-tsc -b

format: ## Format backend code (ruff)
	$(UV) run ruff format $(APP_DIR)

clean: ## Remove build artifacts and virtual envs
	rm -rf $(WEB_DIR)/dist $(WEB_DIR)/node_modules .venv
