WITH ranks AS (
  SELECT user_id, spend, transaction_date,
  Rank() OVER(
    PARTITION BY user_id
    ORDER BY transaction_date) AS rank_num
  FROM transactions
)
SELECT user_id, spend, transaction_date
FROM ranks
WHERE rank_num = 3;