SELECT
    id,
    case_id,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        WHEN gender = 'F' THEN 'Female'
        WHEN gender IN ('Bi', 'Binary') THEN 'Transgender'
        ELSE gender
    END AS gender,
    CASE
        WHEN opted = 'T' THEN 'True'
        WHEN opted = 'F' THEN 'False'
        WHEN opted = 'Na' THEN 'False'
        ELSE opted
    END AS opted,
    date AS ref_date
FROM {{ source('sources_case', 'master') }}
