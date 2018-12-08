FROM gettyimages/spark:2.1.0-hadoop-2.7

CMD /usr/spark-2.1.0/sbin/start-history-server.sh
RUN mkdir /tmp/spark-events

# Installing ssh
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Server key
ENV KEYPATH=./id_rsa

#RUN /usr/sbin/sshd -d

## End

# Fix a bug. Hadoop common include avro 1.7.4 which is not compatible with Spark
# I've applied following solution https://github.com/SingularitiesCR/spark-docker/issues/5
COPY lib/avro-1.7.7.jar /tmp/avro-1.7.7.jar
RUN rm $HADOOP_HOME/share/hadoop/common/lib/avro-1.7.4.jar \
    && rm $HADOOP_HOME/share/hadoop/mapreduce/lib/avro-1.7.4.jar \
    && cp /tmp/avro-1.7.7.jar $HADOOP_HOME/share/hadoop/common/lib \
    && mv /tmp/avro-1.7.7.jar $HADOOP_HOME/share/hadoop/mapreduce/lib

WORKDIR $SPARK_HOME