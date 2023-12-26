{{
    config(
        materialized='external',
        location="{{ env_var('MELTANO_PROJECT_ROOT') }}/data/data_catalog/silver/{{this.name}}.parquet"
    )
}}

SELECT  
	annee::INT AS annee,
	code_departement::VARCHAR AS departement,
	nom_departement::VARCHAR as nom,
    nb_sites_photovoltaique_enedis::INT AS nb_sites_photo,
    nb_sites_eolien_enedis::INT AS nb_sites_eolien,
    energie_produite_annuelle_eolien_enedis_mwh::DOUBLE AS nrj_eolien,
    energie_produite_annuelle_photovoltaique_enedis_mwh::DOUBLE as nrj_photo
FROM {{ source( 'prod_elec_enedis', 'prodelec' ) }}



