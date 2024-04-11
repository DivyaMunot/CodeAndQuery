WITH RECURSIVE Numbers AS (
    SELECT 20 AS Value -- Start with the maximum number of asterisks
    UNION ALL
    SELECT Value - 1 -- Decrease by one in each step
    FROM Numbers
    WHERE Value > 1 -- Continue until we reach 1
)
SELECT REPEAT('* ', Value) AS Pattern
FROM Numbers
ORDER BY Value DESC;