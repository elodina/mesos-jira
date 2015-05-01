# mesos-jira


## Docker

Atlassian JIRA containerized.

### Building the container

`docker build -t elodina/jira .`

### Execution

The following example will run a JIRA server in detached mode on host port `80`, with application state stored in host directory `~/.jira`.

`docker run -d -p 80:8080 -v ~/.jira:/data elodina/jira`


## Mesos

TODO!

