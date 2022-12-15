-- # 1. Connector Creation
CREATE SOURCE CONNECTOR kdrm_source WITH (
    'connector.class'                           = 'io.debezium.connector.postgresql.PostgresConnector',
    'tasks.max'                                 = '1',
    'database.port'                             = '5432',
    'database.hostname'                         = 'postgres',
    'database.user'                             = 'postgres',
    'database.dbname'                           = 'postgres',
    'database.password'                         = 'postpass',
    'database.server.name'                      = 'dbserver1',
    'database.whitelist'                        = 'postgres',
    'topic.prefix'                              = 'psql_',
    'table.whitelist'                           = 'kdrama_list',
    'database.history.kafka.bootstrap.servers'  = 'broker:9092',
    'database.history.kafka.topic'              = 'schema-changes.postgres',
    'mode'                                      = 'incrementing',
    'numeric.mapping'                           = 'best_fit',
    'key'                                       = 'list_id'
);

-- # 4. Stream Creation
create stream stream_table (
    list_id int key,
    drama_name varchar(150),
    episodes int,
    orig_network varchar(75),
    score_list double,
    scored_by int,
    watchers double,
    imdb_desc varchar(255)) 
    WITH (kafka_topic='kdrm_kdrama_list', value_format='json', partitions=1
    );

-- # 5. Table Creation
CREATE TABLE final_table as
    SELECT 
        drama_name, 
        avg(score_list) as rating,
        sum(scored_by) as total_raters, 
        sum(watchers) as total_watchers  
    FROM stream_table st
    GROUP BY 
        drama_name
    emit changes;

-- 6. Streaming Insertion
insert into stream_table values (11, 'Hospital Playlist', 12, '...', 8.5, 3, 7, '...');
insert into stream_table values (12, 'Hospital Playlist', 12, '...', 9.5, 1, 3, '...');
insert into stream_table values (13, 'Descendants of the Sun', 16, '...', 8.8, 6, 10, '...');
insert into stream_table values (14, 'Mouse', 20, '...', 9, 10, 10, '...');
insert into stream_table values (15, 'Vincenzo', 12, '...', 9.3, 13, 25, '...');
insert into stream_table values (16, 'Extraordinary Attorney Woo', 16, '...', 9.6, 4, 7, '...');
insert into stream_table values (17, 'Extraordinary Attorney Woo', 16, '...', 9.0, 8, 8, '...');

-- 7. Final Table
select * from final_table WHERE rating > 9.0;