# Developer Context for AI Assistants

## Version

- Current: **0.0.1** (2025-07-28)

## Primary Goals

- Lightweight but production-ready Django backend
- Modular and easy to extend
- Secure, reproducible, and team-friendly
- CI/CD ready with GitHub Actions
- Pre-commit hooks for consistent code quality

## Included Features

- Modular `settings/` (base, dev, prod, test, restframework, logging)
- GitHub Actions: linting + tests (with optional Postgres service)
- Makefile: setup, runserver, migrations, lint, format, requirements
- Pre-commit hooks: black, isort, flake8, YAML and whitespace checks
- Example apps (`custom_user`, `dashboard`)
- SQLite by default, Postgres optional

## Updating Pre-commit Hooks

If pre-commit fails due to outdated hook versions:

```bash
pre-commit autoupdate
pre-commit install
