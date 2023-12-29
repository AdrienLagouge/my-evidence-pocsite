# Classement des départements métropolitains avec le plus grand nombre de sites de production électrique renouvelable  en 2022

Les données sources présentées sur cette page sont obtenues par interrogation d'une API publique offerte par [Open Data Enedis](https://data.enedis.fr/explore/dataset/production-electrique-par-filiere-a-la-maille-epci/information/)

<Alert status="info">
Cliquez sur le nom d'un département dans les tableaux ci-dessous pour retrouver ses résultats détaillés !
</Alert>

## Production éolienne 

```sql rank_eolien
select 
    departement || ' - ' || nom as 'Département',
    nb_sites_eolien AS "Nombre de sites repertoriés",
    '/' || nom as dpt_link
FROM src_prod_elec_departement
ORDER BY "Nombre de sites repertoriés" DESC
```

<DataTable data={rank_eolien} link=dpt_link rows=10 rowShading="true">
  <Column id='Département'/> 
  <Column id='Nombre de sites repertoriés'contentType=colorscale scaleColor=blue//>
</DataTable>

## Production photovoltaique

```sql rank_photo
select 
    departement || ' - ' || nom as 'Département',
    nb_sites_photo AS "Nombre de sites repertoriés",
    '/' || nom as dpt_link
FROM src_prod_elec_departement
ORDER BY "Nombre de sites repertoriés" DESC
```

<DataTable data={rank_photo} link=dpt_link rows=10 rowShading="true">
  <Column id='Département'/> 
  <Column id='Nombre de sites repertoriés'contentType=colorscale scaleColor=blue//>
</DataTable>