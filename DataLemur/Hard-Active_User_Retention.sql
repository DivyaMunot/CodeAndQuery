WITH active_users AS (
  SELECT user_id
  FROM user_actions
  WHERE date_part('month', event_date) = 6 AND date_part('year', event_date) = 2022
  INTERSECT
  SELECT user_id
  FROM user_actions
  WHERE date_part('month', event_date) = 7 AND date_part('year', event_date) = 2022
)

SELECT 7 AS "month", COUNT(user_id) AS monthly_active_users 
FROM active_users;
