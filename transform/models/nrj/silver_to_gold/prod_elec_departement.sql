SELECT 
    annee,
    departement, 
    nom,
    sum(nb_sites_photo) AS nb_sites_photo,
    sum(nb_sites_eolien) AS nb_sites_eolien,
    sum(nrj_photo) as nrj_photo,
    sum(nrj_eolien) as nrj_eolien
FROM {{ ref('prod_elec') }} 
GROUP BY annee,departement,nom
ORDER BY nb_sites_eolien DESC