with join_1 as (
    SELECT
        A.conso_totale as conso_elec,
        A.nom,
        A.annee,
        B.conso_totale as conso_gaz
    FROM src_conso_elec_departement AS A
    LEFT JOIN src_conso_gaz_departement AS B
        ON A.nom = B.nom AND A.annee = B.annee
)

SELECT
    A.conso_elec AS 'Consommation électrique',
    A.conso_gaz AS 'Consommation de gaz',
    B.nom,
    B.annee::INT AS annee,
    B.conso_totale 
FROM join_1 AS A
LEFT JOIN src_conso_ttype_departement AS B
    ON A.nom = B.nom AND A.annee = B.annee
ORDER BY annee
