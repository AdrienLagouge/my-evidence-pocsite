---
title: Données de consommation annuelle d’électricité et gaz par commune et par secteur d’activité (OpenData GRD)
---

# Carte de la consommation d'énergie (électricité, gaz) en France métropolitaine

```sql conso_nrj_69
select *
from src_conso_elec_departement
where departement = '69'
```

<DataTable data={conso_nrj_69} rows=6/>