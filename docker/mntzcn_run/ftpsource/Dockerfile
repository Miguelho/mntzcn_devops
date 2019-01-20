FROM mntzcn/hadoop-2.7.1-java-1.8

ADD data/events/telephoneEvents-05_06_2017.csv /opt/ingestion/telephoneEvents-05_06_2017.csv
ADD ingestion.sh /opt/ingestion/events/ingestion.sh

# This should be ddl.hql volume of the original Data

RUN useradd -ms /bin/bash oozie \
&& mkdir -p /logs/server/ \
&& cp /opt/ingestion/telephoneEvents-05_06_2017.csv /logs/server/telephoneEvents-05_06_2017.csv

WORKDIR /user/root

# CMD ["sh", "/opt/ingestion/events/ingestion.sh", "/logs/server/",".","2018-12-30", "-d" ]
CMD ["sh", "/opt/ingestion/events/ingestion.sh", "/logs/server/",".","2019-01-11", "-d" ]
