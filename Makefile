install:
	poetry install

dev:
	poetry run flask --app page_analyzer:app run

PORT ?= 8000
start:
	poetry run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

selfcheck:
	poetry check

lint:
	poetry run flake8 page_analyzer

.PHONY: install test lint selfcheck check build

publish:
	poetry publish --dry-run

check: selfcheck test lint

build: check
	poetry build
