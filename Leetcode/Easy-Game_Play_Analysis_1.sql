WITH cte AS(
    SELECT player_id,
    event_date,
    RANK() OVER(
        PARTITION BY player_id
        ORDER BY event_date
    ) AS ranking
    FROM activity
)

SELECT player_id, event_date AS first_login
FROM cte
WHERE ranking = 1;