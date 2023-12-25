with join_1 as (
    SELECT
        A.conso_totale as conso_elec,
        A.nom,
        A.annee,
        B.conso_totale as conso_gaz
    FROM src_conso_elec_departement A
    LEFT JOIN src_conso_gaz_departement B
        ON A.nom = B.nom AND A.annee = B.annee
)

SELECT
    A.conso_elec,
    A.conso_gaz,
    B.nom,
    B.annee,
    B.conso_totale 
FROM join_1 A
LEFT JOIN src_conso_ttype_departement B
    ON A.nom = B.nom AND A.annee = B.annee
