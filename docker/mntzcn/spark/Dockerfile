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
#RUN wget https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-5.1.45.tar.gz
#RUN tar xf mysql-connector-java-5.1.45.tar.gz
#RUN mv mysql-connector-java-5.1.45/mysql-connector-java-5.1.45-bin.jar /opt/spark/jars
#RUN rm -rf mysql-connector-java-5.1.45

RUN mkdir -p /shared_data

ENV SPARK_VERSION 2.3.0
ENV SPARK_HOME /opt/spark

WORKDIR $SPARK_HOME

# -- HADOOP CONFIGURATION
ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootsrap.sh \
&& sh /etc/bootstrap.sh