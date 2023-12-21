{% macro surrogate_key (column_nm) -%}
   {{ dbt_utils.generate_surrogate_key([column_nm]) }}
{%- endmacro %}