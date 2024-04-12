SELECT DISTINCT sender_id, 
    COUNT(message_id) AS message_count 
FROM messages 
WHERE date_part('year', sent_date) = 2022 AND date_part('month', sent_date) = 08
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC
LIMIT 2;