# Import log file
With the mongo service running, run:
```sh
docker-compose exec mongo mongoimport -d logs -c kong --type=json --file /application-logs/data.log
```

This command will import the `./data/logs/data.log` file into a `kong` collection inside a `logs` database