CREATE TABLE netflix_analytics.fact_ratings AS
WITH all_ratings AS (
    SELECT
        TRY_CAST(NULLIF(userid, '') AS BIGINT) AS user_id,
        TRY_CAST(NULLIF(movieid, '') AS BIGINT) AS movie_id,
        TRY_CAST(NULLIF(NULLIF(rating, 'NA'), '') AS DOUBLE) AS rating,
        COALESCE(
            try(from_iso8601_timestamp("timestamp")),
            try(date_parse("timestamp", '%Y-%m-%d %H:%i:%s'))
        ) AS rating_ts,
        'user_rating_history' AS src
    FROM netflix_raw.raw_user_recommendation_history

    UNION ALL

    SELECT
        TRY_CAST(NULLIF(userid, '') AS BIGINT) AS user_id,
        TRY_CAST(NULLIF(movieid, '') AS BIGINT) AS movie_id,
        TRY_CAST(NULLIF(NULLIF(rating, 'NA'), '') AS DOUBLE) AS rating,
        COALESCE(
            try(from_iso8601_timestamp("timestamp")),
            try(date_parse("timestamp", '%Y-%m-%d %H:%i:%s'))
        ) AS rating_ts,
        'rating_for_additional_users' AS src
    FROM netflix_raw.raw_user_additional_rating
)

SELECT
    user_id,
    movie_id,
    rating,
    rating_ts,
    src
FROM all_ratings
WHERE user_id IS NOT NULL
  AND movie_id IS NOT NULL
  AND rating IS NOT NULL
  AND rating_ts IS NOT NULL;