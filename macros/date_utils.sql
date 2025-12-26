{% macro get_season(column_name) %}

CASE
    WHEN MONTH(TO_TIMESTAMP({{ column_name }})) IN (12, 1, 2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{ column_name }})) IN (3, 4, 5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{ column_name }})) IN (6, 7, 8)
    THEN 'SUMMER'
    WHEN MONTH(TO_TIMESTAMP({{ column_name }})) IN (9, 10, 11)
    THEN 'AUTUMN'
END

{% endmacro %}

{% macro get_day_type(column_name) %}

CASE
    WHEN DAYNAME(TO_TIMESTAMP({{ column_name }})) IN ('Sat', 'Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
END

{% endmacro %}