SELECT 
    ROUND(AVG(median_table.LAT_N), 4) AS median
FROM (
    SELECT 
        s.LAT_N, 
        @row_num := @row_num + 1 AS 'row_number',
        @total_rows := @row_num
    FROM 
        STATION s, 
        (SELECT @row_num := 0) r
    ORDER BY 
        s.LAT_N
) AS median_table
WHERE 
    median_table.row_number IN (FLOOR((@total_rows + 1) / 2), FLOOR((@total_rows + 2) / 2));
