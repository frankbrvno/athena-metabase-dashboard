CREATE VIEW netflix_views.vw_ratings_heatmap AS
SELECT 
    EXTRACT(YEAR FROM rating_ts) AS year,
    EXTRACT(MONTH FROM rating_ts) AS month_number,
    format_datetime(rating_ts, 'MMM') AS month_name,
    COUNT(*) AS total_ratings
FROM netflix_analytics.fact_ratings
GROUP BY
    1, 2, 3
ORDER BY
    1, 2