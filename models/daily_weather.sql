WITH daily_weather AS (
    SELECT
        DATE(TIME) AS DAILY_WEATHER,
        WEATHER,
        TEMP,
        PRESSURE,
        HUMIDITY,
        CLOUDS
    FROM
        {{ source('demo', 'weather') }}
),

daily_weather_agg AS (
    SELECT
        DAILY_WEATHER,
        WEATHER,
        ROUND(AVG(TEMP), 2) AS AVG_TEMP,
        ROUND(AVG(PRESSURE), 2) AS AVG_PRESSURE,
        ROUND(AVG(HUMIDITY), 2) AS AVG_HUMIDITY,
        ROUND(AVG(CLOUDS), 2) AS AVG_CLOUDS
    FROM
        daily_weather
    GROUP BY
        WEATHER, DAILY_WEATHER
    QUALIFY
        ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY COUNT(WEATHER) DESC) = 1
)

SELECT
    *
FROM
    daily_weather_agg