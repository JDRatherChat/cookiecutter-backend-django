# Code Style Guide

This project enforces:
- **Black** formatting (88 char limit, double blank lines around top-level defs/classes)
- **isort** import sorting (stdlib → third-party → local)
- **Flake8** linting, with ignores for Django settings star imports
- **mypy** type checking, with strict optional checks

These rules ensure consistent, clean, and production-ready code.
