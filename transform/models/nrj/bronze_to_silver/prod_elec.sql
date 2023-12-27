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
    CASE 
        WHEN nb_sites_photovoltaique_enedis::INT < 0 OR  nb_sites_photovoltaique_enedis::INT  IS NULL THEN 0
        ELSE nb_sites_photovoltaique_enedis::INT 
    END
    AS nb_sites_photo,
    CASE 
        WHEN nb_sites_eolien_enedis::INT < 0 OR  nb_sites_eolien_enedis::INT  IS NULL THEN 0
        ELSE nb_sites_eolien_enedis::INT 
    END
    AS nb_sites_eolien,
    energie_produite_annuelle_eolien_enedis_mwh::DECIMAL(10,2) AS nrj_eolien,
    energie_produite_annuelle_photovoltaique_enedis_mwh::DECIMAL(10,2) as nrj_photo
FROM {{ source( 'prod_elec_enedis', 'prodelec' ) }}



