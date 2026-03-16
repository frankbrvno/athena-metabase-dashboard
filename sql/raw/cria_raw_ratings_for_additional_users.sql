CREATE EXTERNAL TABLE IF NOT EXISTS netflix_raw.raw_ratings_for_additional_users
(
    userID STRING, 
    movieID STRING,
    rating STRING,
    timestamp STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    'separatorChar' = ',',
    'quoteChar'     = '"',
    'escapeChar'    = '\\'
)
STORED AS TEXTFILE
LOCATION 's3://netflix-pipeline-desafio/bronze/ratings_for_additional_users/'
TBLPROPERTIES ("skip.header.line.count"="1");