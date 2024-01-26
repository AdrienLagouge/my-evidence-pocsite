package-install:
	pip install -r requirements.txt
	pipx ensurepath
	pipx install poetry
	pipx ensurepath
	poetry config virtualenvs.in-project true
	poetry install --no-root
	poetry shell

pipeline-build:
	meltano install

pipeline-run:
	mkdir -p data/data_catalog/silver
	meltano run tap-spreadsheets-anywhere target-duckdb \
	--full-refresh
	meltano run tap-rest-api-msdk target-duckdb--api
	meltano invoke dbt-duckdb deps
	meltano invoke dbt-duckdb build

node-install:
	nvm install 16
	nvm use 16
	cd evidence ; npm ci
	cd ..

evidence-serve:
	cd evidence ; npm run sources
	cd .. 
	meltano invoke evidence dev

evidence-build:
	cd evidence ; npm run sources
	cd .. 
	meltano invoke evidence upgrade
	meltano invoke evidence build

