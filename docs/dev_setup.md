# Developer Setup

This guide explains how to configure PyCharm with Black, isort, Flake8, and mypy.

## Code Style
- Set right margin to 88
- Wrap on typing enabled
- Ensure right margin is not exceeded
- 4-space indents

## Tools
- Black: format on save or via `make format`
- isort: auto-sorts imports
- Flake8: linting (per-file-ignores in settings)
- mypy: type checking

## Running Checks
- `make format`
- `make lint`
- `make type`
- `make test`
