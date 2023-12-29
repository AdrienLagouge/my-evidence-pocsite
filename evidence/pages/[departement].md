---
queries:
  - decompo_departement: nrj/decompo_departement.sql 
  - analysis_conso_secteur: nrj/analysis_conso_secteur.sql
---

# {params.departement} : Résultats détaillés 

## Consommation énergétique 

```sql filtered_details
    select *
    from ${decompo_departement}
    where nom = '${params.departement}'
```
``` sql pivoted_table
UNPIVOT ${filtered_details}
ON 'Consommation électrique', 'Consommation de gaz'
INTO
    NAME typenrj
    VALUE 'Consommation (en TWh)'
```

<LineChart
data="{pivoted_table}"
x="annee"
y="Consommation (en TWh)"
series="typenrj"
title="Evolution de la consommation par type d'énergie"
subtitle = "En TWh"
xAxisTitle= "Année"
xGridlines = true
/>

### Par grand type de secteur utilisateur
```sql filtered_details_elec
    WITH long_data AS (
    select *
    from ${analysis_conso_secteur}
    where nom like '${params.departement}' AND typenrj like 'Electricité')

    UNPIVOT long_data
    ON 'Agriculture','Industrie','Tertiaire','Secteur résidentiel','Autre'
    INTO
    NAME secteur_utilisateur
    VALUE 'Part'
```
```sql filtered_details_gaz
    WITH long_data AS (
    select *
    from ${analysis_conso_secteur}
    where nom like '${params.departement}' AND typenrj like 'Gaz')

    UNPIVOT long_data
    ON 'Agriculture','Industrie','Tertiaire','Secteur résidentiel','Autre'
    INTO
    NAME secteur_utilisateur
    VALUE 'Part'
```
<BarChart
    data={filtered_details_elec} 
    x=annee
    y=Part
    title = "Part de chaque secteur dans la consommation électrique"
    subtitle = "en %"
    series=secteur_utilisateur
    xAxisTitle= "Année"
    yAxisTitle= false
    yMin = 0
    yMax = 100
/>

<BarChart
    data={filtered_details_gaz} 
    x=annee
    y=Part
    title = "Part de chaque secteur dans la consommation de gaz"
    subtitle = "en %"
    series=secteur_utilisateur
    xAxisTitle= "Année"
    yAxisTitle= false
    yMin = 0
    yMax = 100
/>

## Production électrique renouvelable

```sql filtered_details_prod_renouv
select 
  nom,
  CASE WHEN
  nb_sites_eolien > 0 THEN (nrj_eolien/nb_sites_eolien)::DECIMAL(10,1)
  ELSE 0
  END AS "intensité_eolien",
  CASE WHEN
  nb_sites_photo > 0 THEN (nrj_photo/nb_sites_photo)::DECIMAL(10,1) 
  ELSE 0 
  END AS "intensité_photovoltaique",
from src_prod_elec_departement
where nom like '${params.departement}'
```
Comparaison de l'intensité énergétique des sites de production repertoriés dans ce département (nombre moyen de MWh produits en 2022)
- <div> Pour l'éolien  <div class = "font-bold"> <Value data={filtered_details_prod_renouv} column=intensité_eolien/> MWh </div> </div> 
- <div> Pour le photovoltaique  <div class = "font-bold"> <Value data={filtered_details_prod_renouv} column=intensité_photovoltaique/> MWh </div> </div> 

