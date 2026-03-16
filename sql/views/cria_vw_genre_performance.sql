CREATE VIEW netflix_views.vw_genre_performance AS
WITH exploded AS
(
    SELECT 
       r.rating,
       genre
    FROM netflix_analytics.fact_ratings AS r 
    JOIN netflix_analytics.dim_movies AS m 
        ON m.movie_id = r.movie_id
    CROSS JOIN UNNEST(SPLIT(COALESCE(m.genres, ''), '|')) AS t (genre)
)
SELECT 
    genre,
    COUNT(*) AS total_ratings,
    AVG(rating) AS avg_rating,
    STDDEV(rating) AS std_rating
FROM exploded 
WHERE genre IS NOT NULL 
  AND genre != ''
  AND genre != '(no genres listed)'
GROUP BY 1;