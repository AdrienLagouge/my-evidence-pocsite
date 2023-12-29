WITH 
all_present_dep AS (
    (SELECT nom FROM {{ ref('conso_elec') }} ) 
    INTERSECT (SELECT nom FROM {{ ref('conso_gaz') }})
    INTERSECT (SELECT nom FROM {{ ref('prod_elec') }})
),
calcul AS (
    SELECT 
        year(annee) as annee,
        departement, 
        nom,
        0.000001*floor(sum(conso_totale)) AS conso_totale,
        0.000001*floor(sum(conso_agri)) AS conso_agri,
        0.000001*floor(sum(conso_indus)) AS conso_indus,
        0.000001*floor(sum(conso_tertiaire)) AS conso_tertiaire,
        0.000001*floor(sum(conso_autre)) AS conso_autre,
        0.000001*floor(sum(conso_resid)) AS conso_resid
        FROM {{ ref('conso_elec') }} 
        GROUP BY departement,annee,nom
)

SELECT *
FROM calcul 
RIGHT JOIN all_present_dep
ON calcul.nom = all_present_dep.nom



