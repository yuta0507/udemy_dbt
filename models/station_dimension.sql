WITH bike AS (
    SELECT DISTINCT
        START_STATION_ID AS STATION_ID,
        START_STATION_NAME AS STATION_NAME,
        START_LAT,
        START_LNG
    FROM
        {{ ref('stg_bike') }}
    WHERE
        RIDE_ID != 'ride_id'
)

SELECT
    *
FROM
    bike
