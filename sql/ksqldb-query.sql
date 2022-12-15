-- # Stream Creation
create stream stream_table (
    list_id int key,
    drama_name varchar(150),
    episodes int,
    orig_network varchar(75),
    score_list double,
    scored_by int,
    watchers double,
    imdb_desc string) 
    WITH (kafka_topic='kdrm_kdrama_list', value_format='json', partitions=1
    );