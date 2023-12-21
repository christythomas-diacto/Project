{% macro coalesce_language() %}
    COALESCE(language, 'English')
{% endmacro %}

{% macro coalesce_case_status() %}
    COALESCE(
        CASE 
            WHEN case_status ILIKE '0' THEN 'Not Accepted'
            WHEN case_status ILIKE '1' THEN 'Accepted'
            WHEN case_status = 'Na' THEN 'Not Accepted'
            ELSE case_status
        END,
        'Accepted'
    )
{% endmacro %}
