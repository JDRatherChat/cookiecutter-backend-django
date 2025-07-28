# Use bash for better compatibility
SHELL := /bin/bash

# Default environment
ENV ?= dev

.PHONY: runserver makemigrations migrate shell requirements sync setup format lint type test merge tag push commit

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
	.venv/Scripts/python -m pip install --upgrade pip
	.venv/Scripts/python -m pip install pip-tools pre-commit
	make requirements ENV=$(ENV)
	make sync ENV=$(ENV)
	pre-commit install
	@echo "Setup complete! Activate your venv with: .venv/Scripts/activate"

# ============================================
# Developer Commands (v0.0.4)
# ============================================

# Format code using Black and isort
format:
	.venv/Scripts/python -m black .
	.venv/Scripts/python -m isort .
	@echo "✅ Code formatted."

# Lint using Flake8
lint:
	.venv/Scripts/python -m flake8 .
	@echo "✅ Lint check complete."

# Type checking using mypy
type:
	.venv/Scripts/python -m mypy .
	@echo "✅ Type check complete."

# Run tests using pytest
test:
	.venv/Scripts/python -m pytest
	@echo "✅ Tests complete."

# Create a commit (usage: make commit m="Your message")
commit:
	@if [ -z "$(m)" ]; then \
		echo "❌ Please specify a commit message: make commit m='Your message'"; \
		exit 1; \
	fi
	@git add -A
	@git commit -m "$(m)"
	@echo "✅ Commit created with message: $(m)"

# Merge current feature branch into master with rebase
merge:
	@git checkout master
	@git pull origin master --rebase
	@git merge $$(git symbolic-ref --short HEAD@{1}) --ff-only
	@echo "✅ Branch merged into master with rebase."

# Create a new version tag (usage: make tag v=0.0.4)
tag:
	@if [ -z "$(v)" ]; then \
		echo "❌ Please specify a version: make tag v=0.0.4"; \
		exit 1; \
	fi
	@git tag v$(v)
	@git push origin v$(v)
	@echo "✅ Tagged version v$(v)."

# Push latest master and all tags
push:
	@git push origin master
	@git push origin --tags
	@echo "✅ Master and tags pushed to remote."
