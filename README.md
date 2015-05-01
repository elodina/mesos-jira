# mesos-jira


## Docker

Atlassian JIRA containerized.

### Building the container

`docker build -t elodina/jira .`

### Execution

First, start an external RDBMS that is supported. We will use PostgreSQL.

`docker run --name jira-postgres-standalone -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=changeit -p 5432:5432 -d postgres`

Now, start the JIRA server instance and expose it on host `port 80`.

`docker run --name jira -p 80:8080 -d elodina/jira`


## Mesos

TODO!

