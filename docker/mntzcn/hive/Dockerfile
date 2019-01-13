FROM mntzcn/hadoop-2.7.1-java-1.8

# -- install Hive

RUN wget http://apache.claz.org/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz
RUN tar xf apache-hive-1.2.2-bin.tar.gz
RUN mv apache-hive-1.2.2-bin /opt
RUN ln -s /opt/apache-hive-1.2.2-bin /opt/hive
RUN rm apache-hive-1.2.2-bin.tar.gz

RUN mkdir -p /shared_data

# -- install MySQL client jar for Hive

#RUN wget https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-5.1.45.tar.gz
COPY jdbc/mysql-connector-java-8.0.12.jar /opt/hive/lib
# RUN tar xf mysql-connector-java-5.1.45.tar.gz
# RUN mv mysql-connector-java-5.1.45/mysql-connector-java-5.1.45-bin.jar /opt/hive/lib
# RUN rm -rf mysql-connector-java-5.1.45

# -- ADD PROJECT FILES
ADD core-site.xml.template /usr/local/hadoop/etc/hadoop/core-site.xml.template
ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh

ADD hql/ddl.hql /opt/hive/ddl.hql

CMD ["sh", "/etc/bootstrap.sh", "-d"]