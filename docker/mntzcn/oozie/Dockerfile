FROM andlaz/hadoop-oozie
COPY bootstrap.sh /etc/bootstrap.sh
COPY job.properties /job.properties
# Jobhistory server config
COPY hadoop-config.xml /etc/hadoop-config.xml
RUN chmod +x /etc/bootstrap.sh
RUN /etc/bootstrap.sh
WORKDIR /opt/oozie-4.2.0/
ENV OOZIE_URL http://localhost:11000/oozie