FROM mntzcn/hadoop-2.7.1-java-1.8

# Download & Install Spark
RUN wget https://archive.apache.org/dist/spark/spark-2.3.0/spark-2.3.0-bin-hadoop2.7.tgz
RUN tar xf spark-2.3.0-bin-hadoop2.7.tgz
RUN mv spark-2.3.0-bin-hadoop2.7 /opt
RUN ln -s /opt/spark-2.3.0-bin-hadoop2.7 /opt/spark
RUN rm spark-2.3.0-bin-hadoop2.7.tgz

# Download & Install MySql Driver
ENV MYSQL_CONNECTOR_VERSION 8.0.12
ADD lib/jdbc/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.jar /opt/spark/jars

RUN mkdir -p /shared_data

ENV SPARK_VERSION 2.3.0
ENV SPARK_HOME /opt/spark

WORKDIR $SPARK_HOME

# -- HADOOP CONFIGURATION
ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh \
&& sh /etc/bootstrap.sh

USER root
# -- OOZIE CONFIGURATION
ADD wait.sh /etc/wait.sh
ADD setup-oozie.sh /etc/setup-oozie.sh

RUN chown root /etc/wait.sh \
&& chmod +x /etc/wait.sh
#&& /etc/wait.sh http://hadoop:50070 sh /etc/setup-oozie.sh