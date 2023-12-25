---
queries:
  - classement_nrj_france: nrj/classement_nrj_france.sql  
  - tableau_nrj_France: nrj/tableau_nrj_france.sql
  - carte_nrj_France: nrj/carte_nrj_france.sql
---

# Classement des départements français les plus consommateurs d'énergie en 2021

Le fichier source correspondant aux données présentées ci-dessous est à retrouver sur le site de [Open Data GRD](https://opendata.agenceore.fr/explore/dataset/conso-elec-gaz-annuelle-par-secteur-dactivite-agregee-commune/information/)

Consommation énergétique (gaz et électricité) des départements français

<DataTable data={tableau_nrj_france} link=dpt_link rows=7 rowShading="true">
  <Column id='N°'/>
  <Column id='Département'/> 
  <Column id='Consommation (en TWh)'contentType=colorscale scaleColor=blue//>
</DataTable>

<FranceMapModified
    title = 'Représentation cartographique'
    data={carte_nrj_france} 
    region= nom
    value= 'Consommation (en TWh)'
    link = dpt_link
/>







