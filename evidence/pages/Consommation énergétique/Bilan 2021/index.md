---
queries:
  - classement_nrj_france: nrj/classement_nrj_france.sql  
  - tableau_nrj_France: nrj/tableau_nrj_france.sql
  - carte_nrj_France: nrj/carte_nrj_france.sql
---

# Classement des départements métropolitains les plus consommateurs d'énergie en 2021

Le fichier plat (.csv) correspondant aux données sources présentées ci-dessous est à retrouver sur le site de [Open Data GRD](https://opendata.agenceore.fr/explore/dataset/conso-elec-gaz-annuelle-par-secteur-dactivite-agregee-commune/information/)

<Alert status="info">
Cliquez sur le nom d'un département dans le tableau ou sur la carte pour retrouver ses résultats détaillés !
</Alert>

## Consommation totale (gaz et électricité) 

<DataTable data={tableau_nrj_france} link=dpt_link rows=10 rowShading="true">
  <Column id='Département'/> 
  <Column id='Consommation (en TWh)'contentType=colorscale scaleColor=blue//>
</DataTable>

<FranceMapModified
    data={carte_nrj_france} 
    region= nom
    value= 'Consommation (en TWh)'
    link = dpt_link
/>







