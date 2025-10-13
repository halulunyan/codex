# Multi-Stack Template

Starter repository combining Terraform infrastructure, Kubernetes manifests, and a FastAPI application. Use it as a foundation for projects that need cloud provisioning, container orchestration, and a Python backend.

## Repository Layout

- `infra/terraform/` – reusable modules and per-environment Terraform stacks.
- `infra/kubernetes/` – Kustomize base manifests with environment overlays.
- `api/` – FastAPI service, configuration, and tests.
- `compose/` – Docker Compose definitions for local development.
- `assets/` – Architecture diagrams or prompt templates (add as needed).
- `.github/workflows/` – GitHub Actions for linting, testing, and manifest checks.

## Getting Started

1. Install dependencies:
   ```bash
   poetry install
   ```
2. Run FastAPI locally with auto reload:
   ```bash
   make dev-up
   ```
   Visit http://localhost:8000/docs for interactive docs.
3. Run tests and linters:
   ```bash
   make lint
   make test
   ```
4. Plan infrastructure (defaults to `dev` environment):
   ```bash
   make terraform-init
   make terraform-plan
   ```

## Environment Variables

Copy `.env.example` to `.env` and adjust values before running locally or in containers.

## CI Overview

GitHub Actions pipeline runs Python lint/tests, Terraform validation, and Kustomize builds on every push and pull request.
