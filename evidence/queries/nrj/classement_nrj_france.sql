SELECT
        conso_totale as consotwh,
        nom,
        departement,
        '/Consommation énergétique/Bilan 2021/' || nom as dpt_link
FROM src_conso_ttype_departement
WHERE annee = 2021
ORDER BY consotwh DESC