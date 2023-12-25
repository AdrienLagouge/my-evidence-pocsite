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
	consoa::DOUBLE AS conso_agri,
	consoi::DOUBLE AS conso_indus,
	consot::DOUBLE AS conso_tertiaire,
	consor::DOUBLE AS conso_resid,
	consona::DOUBLE AS conso_autre,
	code_commune,
	code_departement AS departement,
	libelle_departement as nom,
	consototale::DOUBLE AS conso_totale
FROM {{ source( 'conso_nrj_opengrdf', 'conso_nrj_bdd' ) }}
WHERE filiere = 'Electricité'

