CREATE VIEW netflix_views.vw_popularity_vs_quality AS 
    SELECT
        movie_id,
        title,
        genres,
        release_year,
        total_ratings,
        avg_rating
    FROM netflix_views.vw_movies_kpis
    WHERE total_ratings >=50