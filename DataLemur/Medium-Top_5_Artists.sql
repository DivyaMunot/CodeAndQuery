SELECT artist_name, artist_rank
FROM (
    SELECT a.artist_name,
        DENSE_RANK() OVER(
            ORDER BY COUNT(songs.song_id) DESC
        ) AS artist_rank
    FROM artists a
        INNER JOIN songs ON a.artist_id = songs.artist_id
        INNER JOIN global_song_rank ON songs.song_id = global_song_rank.song_id
    WHERE global_song_rank.rank < 11
    GROUP BY a.artist_name
) a
WHERE artist_rank < 6;