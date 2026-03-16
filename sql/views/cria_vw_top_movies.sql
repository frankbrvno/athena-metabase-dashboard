CREATE VIEW netflix_views.vw_top_movies AS
    SELECT 
        movie_id,
        title,
        genres, 
        release_year,
        total_ratings,
        ROUND(avg_rating, 2) AS avg_rating
    FROM netflix_views.vw_movies_kpis 
    WHERE total_ratings >= 20 
    AND total_ratings BETWEEN 0 AND 5 
    ORDER BY avg_rating DESC, total_ratings DESC 
    LIMIT 10