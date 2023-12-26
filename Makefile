pipeline-build:
	meltano install

pipeline-run:
	meltano run tap-spreadsheets-anywhere target-parquet
	meltano run tap-rest-api-msdk target-parquet
	meltano invoke dbt-duckdb deps
	meltano invoke dbt-duckdb build

evidence-serve:
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
