PROJECT_NAME ?= multi-stack-template
PYTHON_DIR ?= api
COMPOSE_FILE ?= compose/dev/docker-compose.yml

.PHONY: install format lint test clean dev-up dev-down docker-build docker-run terraform-init terraform-plan terraform-apply kube-validate

install:
	poetry install

format:
	poetry run ruff format $(PYTHON_DIR)

lint:
	poetry run ruff check $(PYTHON_DIR)

test:
	poetry run pytest $(PYTHON_DIR)/tests

clean:
	find $(PYTHON_DIR) -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf $(PYTHON_DIR)/.pytest_cache $(PYTHON_DIR)/.ruff_cache

dev-up:
	docker compose -f $(COMPOSE_FILE) up --build -d

dev-down:
	docker compose -f $(COMPOSE_FILE) down --remove-orphans

docker-build:
	docker build -t $(PROJECT_NAME)-api -f Dockerfile .

docker-run: docker-build
	docker run --rm -p 8000:8000 --env-file .env $(PROJECT_NAME)-api

terraform-init:
	terraform -chdir=infra/terraform/environments/dev init

terraform-plan:
	terraform -chdir=infra/terraform/environments/dev plan

terraform-apply:
	terraform -chdir=infra/terraform/environments/dev apply

kube-validate:
	kubeval --strict infra/kubernetes/base
