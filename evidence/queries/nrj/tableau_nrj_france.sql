SELECT 
    consotwh as 'Consommation (en TWh)',
    departement || ' - ' || nom as "Département",
    dpt_link
FROM ${classement_nrj_france}


