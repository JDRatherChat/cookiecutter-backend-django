# Developer Setup

This guide explains how to configure your environment for the Cookiecutter Django Boilerplate.

## Virtual Environment

- This boilerplate expects a virtual environment located at `.venv/`.
- On Windows, executables are in `.venv/Scripts/`.
- On macOS/Linux, they are in `.venv/bin/`.

## Code Style

- Right margin: 88 characters
- Wrap on typing enabled
- Ensure right margin is not exceeded
- 4-space indents

## Tools

- **Black**: Formats code (`make format`)
- **isort**: Sorts imports (`make format`)
- **Flake8**: Linting (`make lint`)
- **mypy**: Type checking (`make type`)
- **pytest**: Testing (`make test`)

## Git Workflow

- Merge feature branch into master: `make merge`
- Tag a new version: `make tag v=0.0.4`
- Push master + tags: `make push`

⚠️ **Windows Developers**: The included Makefile uses `.venv/Scripts/`.
Change to `.venv/bin/` if running on macOS/Linux.
