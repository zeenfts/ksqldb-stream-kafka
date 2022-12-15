# ksqldb-stream-kafka
Stream Processing " " Data using ksqlDB on Apache Kafka.

1. `docker compose up`
2. `docker exec -it ksqldb-cli ksql http://ksqldb-server:8088` on different terminal to start ksqldb CLI.
3. `docker exec -it postgres psql -U postgres` (password: postpass) on other terminal to go inside postgres.
4. Check [`sql/`](https://github.com/zeenfts/ksqldb-stream-kafka/tree/main/sql) for the relevant query.
5. [`imgs/`](https://github.com/zeenfts/ksqldb-stream-kafka/tree/main/imgs) <-- Expected output.

_**<sub>Note: For step 4, You might want to wait a little bit for the Kafka connect to be detected by ksqldb!</sub>**_