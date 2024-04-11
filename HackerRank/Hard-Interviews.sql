SELECT Contests.contest_id, 
    Contests.hacker_id, 
    Contests.name,
    SUM(total_submissiones) AS total_submissiones,
    SUM(total_accepted_submissions) AS total_accepted_submissions,
    SUM(total_views) AS total_views,
    SUM(total_unique_views) AS total_unique_views
FROM Contests
LEFT JOIN Colleges ON Contests.contest_id = Colleges.contest_id
LEFT JOIN Challenges ON Colleges.college_id = Challenges.college_id
LEFT JOIN (
    SELECT challenge_id,
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
        FROM view_stats
        GROUP BY challenge_id
) AS SQ1 ON Challenges.challenge_id = SQ1.challenge_id
LEFT JOIN (
    SELECT challenge_id,
        SUM(total_submissions) AS total_submissiones,
        SUM(total_accepted_submissions) AS total_accepted_submissions
        FROM submission_stats
        GROUP BY challenge_id
) AS SQ2 ON Challenges.challenge_id = SQ2.challenge_id
GROUP BY Contests.contest_id, Contests.hacker_id, Contests.name
HAVING (total_views + total_unique_views + total_submissiones + total_accepted_submissions) > 0
ORDER BY Contests.contest_id;