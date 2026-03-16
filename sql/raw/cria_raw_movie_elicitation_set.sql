CREATE EXTERNAL TABLE IF NOT EXISTS netflix_raw.raw_movie_elicitation_set
(
    userID STRING, 
    month_idx STRING,
    source STRING,
    tstamp STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    'separatorChar' = ',',
    'quoteChar'     = '"',
    'escapeChar'    = '\\'
)
STORED AS TEXTFILE
LOCATION 's3://netflix-pipeline-desafio/bronze/movie_elicitation_set/'
TBLPROPERTIES ("skip.header.line.count"="1");