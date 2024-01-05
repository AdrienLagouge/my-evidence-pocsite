WITH transform_elec AS (
    SELECT 
        annee::INT AS annee,
        nom,
        100 * conso_agri/conso_totale as 'Agriculture',
        100 * conso_indus/conso_totale as 'Industrie',
        100 * conso_tertiaire/conso_totale as 'Tertiaire',
        100 * conso_resid/conso_totale as 'Secteur résidentiel',
        100 * conso_autre/conso_totale as 'Autre',
        'Electricité' as typenrj
    FROM src_conso_elec_departement
), transform_gaz AS (
    SELECT 
        annee::INT AS annee,
        nom,
        100 * conso_agri/conso_totale as 'Agriculture',
        100 * conso_indus/conso_totale as 'Industrie',
        100 * conso_tertiaire/conso_totale as 'Tertiaire',
        100 * conso_resid/conso_totale as 'Secteur résidentiel',
        100 * conso_autre/conso_totale as 'Autre',
        'Gaz' as typenrj
    FROM src_conso_gaz_departement
)

SELECT * 
FROM transform_elec t1
UNION ALL 
SELECT * 
FROM transform_gaz t2
