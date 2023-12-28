SELECT
        conso_totale as consotwh,
        nom,
        departement,
        '/' || nom as dpt_link
FROM src_conso_ttype_departement
WHERE annee = 2021
ORDER BY consotwh DESC