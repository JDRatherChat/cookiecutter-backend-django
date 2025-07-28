# Use bash for better compatibility
SHELL := /bin/bash

# Default environment
ENV ?= dev

# Run Django development server
runserver:
	@echo "Starting Django runserver..."
	python manage.py runserver

# Create new migrations
makemigrations:
	@echo "Creating new migrations..."
	python manage.py makemigrations

# Apply migrations
migrate:
	@echo "Running database migrations..."
	python manage.py migrate

# Open Django shell_plus
shell:
	@echo "Opening Django shell_plus..."
	python manage.py shell_plus

# Code quality checks
lint:
	@echo "Running code quality checks..."
	pre-commit run --all-files

# Auto-format code
format:
	@echo "Auto-formatting code..."
	black .
	isort .

# Compile requirements using pip-tools
requirements:
	@echo "Compiling requirements..."
	pip-compile requirements/base.in
	pip-compile requirements/$(ENV).in

# Sync environment to compiled requirements
sync:
	@echo "Syncing dependencies..."
	pip-sync requirements/$(ENV).txt

# Full setup: venv, requirements, pre-commit
setup:
	@echo "Setting up development environment..."
	python -m venv .venv
	source .venv/bin/activate && pip install --upgrade pip
	source .venv/bin/activate && pip install pip-tools pre-commit
	make requirements ENV=$(ENV)
	make sync ENV=$(ENV)
	pre-commit install
	@echo "Setup complete! Activate your venv with: source .venv/bin/activate"
