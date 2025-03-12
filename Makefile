install-dev:
	@pip install -r requirements-dev.txt

install:
	@pip install -r requirements.txt

build: clean
	@python setup.py sdist bdist_wheel

clean:
	@rm -rf build dist auth.* *.egg-info

check-build:
	@twine check dist/*

upload:
	@twine upload dist/*

initial-tag:
	@git tag -a -m "Initial tag." v0.0.1

pre-commit:
	@pre-commit install

init-cz:
	@cz init

bump-tag:
	@cz bump --check-consistency --changelog

# build|ci|docs|feat|fix|perf|refactor|style|test|chore|revert|bump
# Development

test-upload:
	@twine upload --repository testpypi dist/*

lint:
	@black gverify/
	@isort gverify/
	@flake8 gverify/
	# @mypy gverify/

