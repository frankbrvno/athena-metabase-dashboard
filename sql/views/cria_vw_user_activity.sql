CREATE VIEW  netflix_views.vw_user_activity AS 
    SELECT 
        user_id, 
        COUNT(*) AS total_ratings,
        COUNT(DISTINCT( movie_id)) AS distinct_movies_rated, 
        AVG(rating) AS avg_rating,
        STDDEV(rating) AS std_rating, 
        MIN(rating_ts) AS first_activity_ts, 
        MAX(rating_ts) AS last_activity_ts
    FROM netflix_analytics.fact_ratings
    GROUP BY 1 
    ORDER BY total_ratings DESC, avg_rating DESC