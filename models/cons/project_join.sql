SELECT *
FROM {{ ref('case_status_s') }} cs
INNER JOIN {{ ref('master_s') }} m ON cs.case_id = m.case_id



