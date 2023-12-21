{{
  config(materialized = 'incremental',
    database = 'PROJECT',
    schema = 'CURATED',
    unique_key = ['CASE_ID'],
    warehouse = 'COMPUTE_WH'    
    )
}}
with case_status_s as
(    SELECT
        *,ROW_NUMBER() OVER(PARTITION BY CASE_ID
                   ORDER BY CASE_ID) as rn
 
    FROM {{ ref('case_status_s') }} AS CS
    qualify rn =1)
   
    select * exclude(rn,patient_id),{{ surrogate_key(['patient_id']) }} AS patient_sk from case_status_s