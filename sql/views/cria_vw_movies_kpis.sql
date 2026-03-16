CREATE VIEW netflix_views.vw_movies_kpis AS 
    SELECT 
        r.movie_id,
        m.title, 
        m.genres,
        m.release_year,
        COUNT(*) AS total_ratings, 
        AVG(r.rating) AS avg_rating, 
        STDDEV(r.rating) AS std_rating, 
        MIN(r.rating_ts) AS first_rating_ts,
        MAX(r.rating_ts) AS last_rating_ts
    FROM netflix_analytics.fact_ratings AS r 
    LEFT JOIN netflix_analytics.dim_movies AS m 
    ON m.movie_id = r.movie_id
    GROUP BY 1, 2, 3, 4