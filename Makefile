package-install:
	pip install -r requirements.txt
	pipx ensurepath
	pipx install poetry
	poetry config virtualenvs.in-project true
	poetry install

pipeline-build:
	meltano install

pipeline-run:
	mkdir -p data/data_catalog/bronze
	mkdir -p data/data_catalog/silver
	meltano run tap-spreadsheets-anywhere target-parquet \
	--full-refresh
	meltano run tap-rest-api-msdk target-parquet
	meltano invoke dbt-duckdb deps

evidence-serve:
	cd evidence ; npm run sources
	cd .. 
	meltano invoke evidence dev

evidence-build:
	cd evidence ; npm run sources
	cd .. 
	meltano invoke evidence upgrade
	meltano invoke evidence build

