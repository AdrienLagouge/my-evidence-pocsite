SELECT 
annee,
departement, 
floor(sum(conso_totale)) AS conso_totale 
FROM {{ ref('conso_gaz') }} 
GROUP BY departement, annee