## Base commands
help: ## Show this help.
	@grep -E '^[a-zA-Z%_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

python-install: ## Install python requirements
	@make setup-requirements

setup-requirements: 
	@pip install -r dev-requirements.txt

install: ## Install project
	@make python-install

test: ## Run all tests
	@python3 -m pytest tests/

remove-unused-imports: ## Remove unused imports
	@autoflake --in-place --remove-all-unused-imports -r . --exclude venv,node_modules

check-unused-imports: ## Check if there is unused imports, raise error if yes
	@autoflake --check-diff --quiet --remove-all-unused-imports -r . --exclude venv,node_modules

check-black: ## check black
	@black . --check

check-isort: ## check isort with black profile
	@isort . --profile black --check-only

lint-quick: ## Remove unused imports, run linters Black and isort
	@make remove-unused-imports && isort . --profile black && black .

lint: ## Run lint-quick and pyright
	@make lint-quick