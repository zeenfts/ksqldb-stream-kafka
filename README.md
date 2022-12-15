# ksqldb-stream-kafka
Stream Processing Data from PostgresSQL using ksqlDB on Apache Kafka.

1. `docker compose up` to start everything.
2. `docker exec -it ksqldb-cli ksql http://ksqldb-server:8088` on different terminal to start ksqldb CLI.
3. `docker exec -it postgres psql -U postgres_u db_postgres` (password: postpass) on other terminal to go inside Postgres.
4. Check [sql/](https://github.com/zeenfts/ksqldb-stream-kafka/tree/main/sql) for the relevant query (open each file for more detailed step which one to executed first). Please scroll down.
5. Expected output --> [imgs/](https://github.com/zeenfts/ksqldb-stream-kafka/tree/main/imgs). Please scroll down.

_**<sub>Note: You might want to wait a little bit for the set-up process, step 1!</sub>**_