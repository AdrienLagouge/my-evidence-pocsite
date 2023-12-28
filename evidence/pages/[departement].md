---
queries:
  - decompo_departement: nrj/decompo_departement.sql  
---

```sql filtered_details
    select *
    from ${decompo_departement}
    where nom like '${params.departement}'
```
# <Value data={filtered_details} column=nom/> : Résultats détaillés 