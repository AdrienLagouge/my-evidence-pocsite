SELECT 
annee,
departement, 
nom,
0.000001*floor(sum(conso_totale)) AS conso_totale,
0.000001*floor(sum(conso_agri)) AS conso_agri,
0.000001*floor(sum(conso_indus)) AS conso_indus,
0.000001*floor(sum(conso_tertiaire)) AS conso_tertiaire,
0.000001*floor(sum(conso_autre)) AS conso_autre,
FROM {{ ref('conso_ttype') }} 
GROUP BY departement, annee,nom