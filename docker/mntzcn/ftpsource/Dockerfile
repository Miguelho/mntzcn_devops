FROM mntzcn/hadoop-2.7.1-java-1.8

ADD ingestion.sh /opt/ingestion/events/ingestion.sh

ADD hdfs-site.xml /etc/hdfs-site.xml
ADD core-site.xml.template /etc/core-site.xml.template

# This should be a volume of the original Data
RUN useradd -ms /bin/bash oozie \
&& mkdir -p /logs/server/ \
&& echo mydata >> /logs/server/test.csv

WORKDIR /user/root

CMD ["sh", "/opt/ingestion/events/ingestion.sh", "/logs/server/",".","2018-12-30", "-d" ]
