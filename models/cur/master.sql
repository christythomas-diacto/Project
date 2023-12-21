{{
  config(materialized = 'incremental',
    database = 'PROJECT',
    schema = 'CURATED',
    unique_key = ['ID'],
    warehouse = 'COMPUTE_WH'    
    )
}}
with master_s as
(    SELECT
        *,ROW_NUMBER() OVER(PARTITION BY ID
                   ORDER BY id) as rn
 
    FROM {{ ref('master_s') }} AS M
    qualify rn =1)
   
    select * exclude(rn) from master_s