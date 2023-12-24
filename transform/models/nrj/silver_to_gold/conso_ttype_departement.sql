SELECT 
annee,
departement, 
floor(sum(conso_totale)) AS conso_totale 
FROM {{ ref('conso_ttype') }} 
GROUP BY departement, annee