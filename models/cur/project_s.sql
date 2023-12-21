{{
  config(materialized = 'incremental',
    database = 'PROJECT',
    schema = 'CURATED',
    unique_key = ['PATIENT_ID'],
    warehouse = 'COMPUTE_WH'    
    )
}}
WITH project AS
(    SELECT
        *,ROW_NUMBER() OVER(PARTITION BY REF_DATE
                   ORDER BY REF_DATE DESC) AS rn
 
    FROM {{ ref('project_join') }} AS CS
    qualify rn =1)
   
    select * exclude(rn), {{ surrogate_key(['patient_id']) }}AS sk from project

