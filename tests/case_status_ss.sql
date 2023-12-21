SELECT 
    *
FROM
    {{ ref('case_status_s') }}
WHERE ratings < 1
LIMIT 10