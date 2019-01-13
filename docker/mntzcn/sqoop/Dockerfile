FROM mntzcn/hadoop-2.7.1-java-1.8

ENV SQOOP_VERSION 1.4.7

## SQOOP
ENV SQOOP_HOME /usr/local/sqoop
RUN curl http://apache.rediris.es/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz | tar -xz -C /usr/local

RUN ln -s /usr/local/sqoop-1.4.7.bin__hadoop-2.6.0 $SQOOP_HOME

ENV PATH $PATH:$HADOOP_HOME/bin:$SQOOP_HOME/bin

COPY bootstrap.sh /etc/bootstrap.sh
# HADOOP CONF
COPY yarn-site.xml.template /etc/yarn-site.xml.template
COPY core-site.xml.template /etc/core-site.xml.template
# DRIVER CONNECTOR VERSION
ENV MYSQL_CONNECTOR_VERSION 8.0.12
ADD jdbc/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.jar /etc/sqoop-libs/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.jar
ADD lib/json-20180813.jar /usr/local/sqoop/lib/json-20180813.jar
# COPY SQOOP JOBS
RUN mkdir -p /opt/sqoop/jobs/
COPY jobs/* /opt/sqoop/jobs/

RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]