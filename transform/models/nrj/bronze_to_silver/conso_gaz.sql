{{
    config(
        materialized='external',
        location="{{ env_var('MELTANO_PROJECT_ROOT') }}/data/data_catalog/silver/{{this.name}}.parquet"
    )
}}

SELECT  
	opérateur,
	strptime(année, '%Y') AS annee,
	filière as filiere,
	consommation_agriculture_mwh::DOUBLE AS conso_agri,
	consommation_industrie_mwh ::DOUBLE AS conso_indus,
	consommation_tertiaire_mwh::DOUBLE AS conso_tertiaire,
	consommation_résidentiel_mwh::DOUBLE AS conso_resid,
	consommation_secteur_inconnu_mwh ::DOUBLE AS conso_autre,
	code_commune,
	code_département AS departement,
	libellé_département as nom,
	consommation_totale_mwh ::DOUBLE AS conso_totale
FROM {{ source( 'tap_spreadsheets_anywhere', 'bronze_conso_nrj_opengrdf' ) }}
WHERE filiere = 'Gaz'

