CREATE EXTERNAL TABLE IF NOT EXISTS netflix_raw.raw_user_rating_history
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
LOCATION 's3://netflix-pipeline-desafio/bronze/user_rating_history/'
TBLPROPERTIES ("skip.header.line.count"="1");