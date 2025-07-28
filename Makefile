# Use bash for better compatibility
SHELL := /bin/bash

# Default environment
ENV ?= dev

# Detect virtual environment scripts path
ifeq ($(OS),Windows_NT)
    VENV_BIN := .venv/Scripts
else
    VENV_BIN := .venv/bin
endif

# Run Django development server
runserver:
	@echo "Starting Django runserver..."
	$(VENV_BIN)/python manage.py runserver

# Create new migrations
makemigrations:
	@echo "Creating new migrations..."
	$(VENV_BIN)/python manage.py makemigrations

# Apply migrations
migrate:
	@echo "Running database migrations..."
	$(VENV_BIN)/python manage.py migrate

# Open Django shell_plus
shell:
	@echo "Opening Django shell_plus..."
	$(VENV_BIN)/python manage.py shell_plus

# Code quality checks
lint:
	@echo "Running code quality checks..."
	$(VENV_BIN)/pre-commit run --all-files

# Auto-format code
format:
	@echo "Auto-formatting code..."
	$(VENV_BIN)/black .
	$(VENV_BIN)/isort .

# Compile requirements using pip-tools
requirements:
	@echo "Compiling requirements..."
	$(VENV_BIN)/pip-compile requirements/base.in -o requirements/base.txt
	$(VENV_BIN)/pip-compile requirements/$(ENV).in -o requirements/$(ENV).txt


# Sync environment to compiled requirements
sync:
	@echo "Syncing dependencies..."
	$(VENV_BIN)/pip-sync requirements/$(ENV).txt

# Full setup: venv, requirements, pre-commit
setup:
	@echo "Setting up development environment..."
	python -m venv .venv
	$(VENV_BIN)/python -m pip install --upgrade pip
	$(VENV_BIN)/pip install pip-tools pre-commit
	make requirements ENV=$(ENV)
	make sync ENV=$(ENV)
	$(VENV_BIN)/pre-commit install
	@echo "Setup complete! Activate your venv with:"
	@echo "  source .venv/bin/activate   # Linux/Mac"
	@echo "  source .venv/Scripts/activate     # Windows"
