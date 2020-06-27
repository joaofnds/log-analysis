# Import log files
With the mongo service running, run:
```sh
docker-compose exec mongo sh /logs/import.sh
```

This command will import all logs files (files ending with .log) in `./data/logs` into a `kong` collection inside a `logs` database.


# Export query results

```sh
docker-compose exec mongo sh /queries/export.sh
```