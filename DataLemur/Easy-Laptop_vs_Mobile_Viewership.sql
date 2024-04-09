SELECT DISTINCT
    (SELECT COUNT(user_id)
        FROM viewership
        WHERE device_type = 'laptop') laptop_views,
    (SELECT COUNT(user_id)
        FROM viewership
        WHERE device_type IN ('tablet', 'phone')) mobile_views
FROM viewership;