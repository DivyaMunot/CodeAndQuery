WITH cte AS (
  SELECT user_id, 
  tweet_date,
  tweet_count,
  LAG(tweet_count, 1) OVER(PARTITION BY user_id ORDER BY tweet_date) AS lag1,
  LAG(tweet_count, 2) OVER(PARTITION BY user_id ORDER BY tweet_date) AS lag2
  FROM tweets
)

SELECT user_id,
tweet_date,
CASE
    WHEN lag1 IS NULL AND lag2 IS NULL THEN ROUND(tweet_count, 2)
    WHEN lag1 IS NULL THEN ROUND((lag2 + tweet_count) / 2.0, 2)
    WHEN lag2 IS NULL THEN ROUND((lag1 + tweet_count) / 2.0, 2)
    ELSE ROUND((lag1 + lag2 + tweet_count) / 3.0, 2)
END AS rolling_avg_3d
FROM cte;