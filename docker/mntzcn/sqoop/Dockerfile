FROM sequenceiq/hadoop-docker:2.7.1

ENV JAVA_VERSION 8u191
ENV BUILD_VERSION b13

ENV JAVA_BINARIES_URL https://download.oracle.com/otn-pub/java/jdk/8u192-b12/750e1c8617c5452694857ad95c3ee230/jdk-8u192-linux-x64.rpm
# RUN yum history sync

# Upgrading system
# RUN yum -y upgrade
RUN yum -y install wget || true
RUN yum history sync
# Downloading Java
# RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" $JAVA_BINARIES_URL -O /tmp/jdk-8-linux-x64.rpm

RUN yum -y install /tmp/jdk-8-linux-x64.rpm || true

RUN alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000
RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

ENV JAVA_HOME /usr/java/latest

## SQOOP
ENV SQOOP_HOME /usr/local/sqoop
RUN curl http://apache.rediris.es/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz | tar -xz -C /usr/local

RUN ln -s /usr/local/sqoop-1.4.7.bin__hadoop-2.6.0 $SQOOP_HOME

ENV PATH $PATH:$HADOOP_HOME/bin:$SQOOP_HOME/bin

COPY bootstrap.sh /etc/bootstrap.sh
# HADOOP CONF
COPY yarn-site.xml /etc/yarn-site.xml.template
# DRIVER CONNECTOR VERSION
ADD jdbc/mysql-connector-java-8.0.12.jar /etc/sqoop-libs/mysql-connector-java-8.0.12.jar
ADD lib/json-20180813.jar /usr/local/sqoop/lib/json-20180813.jar
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]