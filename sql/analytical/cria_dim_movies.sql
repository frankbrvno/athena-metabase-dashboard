CREATE TABLE netflix_analytics.dim_movies AS
SELECT
    CAST(movieID AS INTEGER) AS movie_id,
    CAST(title AS VARCHAR) AS title,
    CAST(genres AS VARCHAR) AS genres,
    CAST(regexp_extract(title, '\\((\\d{4})\\)\\s*$', 1) AS INTEGER) AS release_year
FROM netflix_raw.raw_movies;