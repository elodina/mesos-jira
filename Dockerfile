FROM ubuntu:14.04

# Install Oracle Java 7, recommended for production JIRA instances
RUN \
  apt-get update && \
  apt-get install -y software-properties-common git curl && \
  add-apt-repository -y ppa:webupd8team/java && \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/cache/oracle-jdk7-installer && \
  rm -rf /var/lib/apt/lists/*

# Install Atlassian JIRA v6.4.2
RUN \
  cd /opt && \
  apt-get install -y curl && \
  curl -LO https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.4.2.tar.gz && \
  tar -xzf atlassian-jira-6.4.2.tar.gz && \
  ln -s /opt/atlassian-jira-6.4.2-standalone /opt/jira

# Application state
ENV JIRA_HOME /data

# Start server with logging in foreground (use -d to detach)
CMD ["/opt/jira/bin/start-jira.sh", "-fg"]
