# Developer Context for AI Assistants

This project was bootstrapped using Cookiecutter for creating consistent Django backends.

## Primary Goals

- Keep it lightweight but production-ready
- Modular and easy to extend
- Secure, reproducible, and team-friendly
- CI/CD ready with GitHub Actions

## GitHub Actions

This repo includes two workflows:
- **Lint**: runs pre-commit hooks for formatting and linting
- **Tests**: spins up a PostgreSQL service, applies migrations, and runs pytest

## Pre-commit Hooks

Developers should enable pre-commit hooks after generating a new project:

```bash
pip install pre-commit
pre-commit install
```

## AI Assistant Brief

This repo is maintained by JD Gresse and is part of a three-repo open-source series:
1. `cookiecutter-backend-django` (this one)
2. `cookiecutter-frontend-vue`
3. `cookiecutter-fullstack-monorepo`

Dee (AI Assistant) helped plan and build this template. When another developer clones this:
- You can continue with your own AI assistant
- The project is structured for long-term reuse and extendability
- Refer to `README.md` for how to use the Cookiecutter template
