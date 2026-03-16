CREATE EXTERNAL TABLE IF NOT EXISTS netflix_raw.raw_movies
(
    movieID STRING, 
    title STRING,
    genres STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    'separatorChar' = ',',
    'quoteChar'     = '"',
    'escapeChar'    = '\\'
)
STORED AS TEXTFILE
LOCATION 's3://netflix-pipeline-desafio/bronze/movies/'
TBLPROPERTIES ("skip.header.line.count"="1");