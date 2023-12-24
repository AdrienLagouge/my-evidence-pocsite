{{
    config(
        materialized='external',
        location="{{ env_var('MELTANO_PROJECT_ROOT') }}/data/data_catalog/silver/{{this.name}}.parquet"
    )
}}

SELECT  
	operateur,
	annee::INT AS annee,
	filiere,
	consoa::DOUBLE AS Conso_agri,
	consoi::DOUBLE AS Conso_indus,
	consot::DOUBLE AS Conso_tertiaire,
	consor::DOUBLE AS Conso_resid,
	consona AS Conso_autre,
	code_commune,
	code_departement AS departement,
	consototale::DOUBLE AS conso_totale
FROM {{ source( 'conso_nrj_opengrdf', 'conso_nrj_bdd' ) }}
