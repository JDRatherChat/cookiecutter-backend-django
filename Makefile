
.PHONY: format lint type test

format:
	black . && isort .

lint:
	flake8 .

type:
	mypy .

test:
	pytest
