WITH 
all_present_dep AS (
    (SELECT nom FROM {{ ref('conso_elec') }} ) 
    INTERSECT (SELECT nom FROM {{ ref('conso_gaz') }})
    INTERSECT (SELECT nom FROM {{ ref('prod_elec') }})
), calcul AS (
    SELECT 
        year(annee) as annee,
        departement, 
        nom,
        sum(nb_sites_photo) AS nb_sites_photo,
        sum(nb_sites_eolien) AS nb_sites_eolien,
        sum(nrj_photo) as nrj_photo,
        sum(nrj_eolien) as nrj_eolien
    FROM {{ ref('prod_elec') }} 
    GROUP BY annee,departement,nom
    ORDER BY nb_sites_eolien DESC
)

SELECT *
FROM calcul 
RIGHT JOIN all_present_dep
ON calcul.nom = all_present_dep.nom

