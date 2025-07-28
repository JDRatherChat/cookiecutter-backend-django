# Cookiecutter Django Boilerplate

## 🚀 Development Setup

This project includes a `Makefile` with helpful commands for Windows developers.

### Quick Commands

```bash
make format   # Run Black + isort
make lint     # Run Flake8
make type     # Run mypy type checking
make test     # Run pytest
make merge    # Merge feature branch into master with rebase
make tag v=0.0.4   # Tag a new version
make push     # Push master and tags
```

⚠️ **Windows Note**: The Makefile is set up for Windows using `.venv/Scripts/`.
If you are on macOS/Linux, replace `Scripts` with `bin` in the Makefile.
