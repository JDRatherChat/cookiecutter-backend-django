# cookiecutter-backend-django

[![Lint](https://github.com/jdgresse/cookiecutter-backend-django/actions/workflows/lint.yml/badge.svg)](https://github.com/jdgresse/cookiecutter-backend-django/actions/workflows/lint.yml)
[![Tests](https://github.com/jdgresse/cookiecutter-backend-django/actions/workflows/test.yml/badge.svg)](https://github.com/jdgresse/cookiecutter-backend-django/actions/workflows/test.yml)

🛠️ Cookiecutter template for a clean, production-ready Django backend project with modular settings, Docker support, and optional Celery/PostgreSQL integrations.

## Features

- Modular `settings/` structure (base, dev, prod, test, restframework, logging)
- Docker + Docker Compose ready
- `.env` and `django-environ` for secure config management
- Pip-tools (`*.in` and `*.txt`) for clean dependency control
- Optional PostgreSQL and Celery setup
- Apps live in the `apps/` folder
- Pre-wired with `rest_framework` and custom user model example
- Production-friendly defaults

## Usage

```bash
cookiecutter gh:jdgresse/cookiecutter-backend-django
```

You will be prompted to configure the following:

- `project_name`
- `project_slug`
- `author_name`
- `email`
- `python_version`
- `use_docker`
- `use_postgres`
- `use_celery`
- `use_github_actions`
- `license`
- `debug`
- `timezone`

## Project Structure

```
{{ cookiecutter.project_slug }}/
├── apps/
├── config/
│   └── settings/
├── Environments/
├── requirements/
├── templates/
├── static/
├── media/
├── manage.py
└── ...
```

## Pre-commit Setup

Install and enable hooks on your local machine:

```bash
pip install pre-commit
pre-commit install
pre-commit run --all-files
```

This runs checks like:
- Black (code formatting)
- Isort (import sorting)
- Flake8 (linting)
- Trailing whitespace and end-of-file cleanup

## License

This project is licensed under the license you choose during generation (MIT, BSD-3-Clause, or Proprietary).
