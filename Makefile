build:
	pip install -r requirements.txt
	pipx ensurepath
	pipx install meltano==3.1.0
	meltano install
	mkdir -p data/data_catalog/bronze
	mkdir -p data/data_catalog/silver

run:
	meltano invoke dbt-duckdb deps
	meltano invoke dbt-duckdb build

serve:
	cd evidence ; npm run sources
	cd .. 
	meltano invoke evidence dev

evidence-build:
	meltano invoke evidence upgrade
	meltano invoke evidence build

docker-build:
	docker build -t pocsite .

docker-run-evidence:
		docker run \
		--publish 3000:3000 \
	 	--env MELTANO_CLI_LOG_LEVEL=WARNING \
		--env MDS_SCENARIOS=10000 \
		--env MDS_INCLUDE_ACTUALS=true \
		--env MDS_LATEST_RATINGS=true \
		--env MDS_ENABLE_EXPORT=true \
		--env ENVIRONMENT=docker \
		pocsite
		make run serve
