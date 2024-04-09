WITH stats AS (
  SELECT age.age_bucket,
        SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'send') AS send_sum,
        SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'open') AS open_sum,
        SUM(activities.time_spent) AS total_sum
  FROM activities
  INNER JOIN age_breakdown AS age
  ON activities.user_id = age.user_id
  WHERE activities.activity_type IN ('send', 'open')
  GROUP BY age.age_bucket
)

SELECT age_bucket,
  ROUND(100.0 * send_sum / total_sum, 2) AS send_perc,
  ROUND(100.0 * open_sum / total_sum, 2) AS open_perc
FROM stats;