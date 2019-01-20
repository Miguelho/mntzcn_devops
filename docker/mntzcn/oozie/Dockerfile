FROM andlaz/hadoop-oozie
COPY bootstrap.sh /etc/bootstrap.sh
# hdfs default server
ADD hdfs/core-site.xml.template /etc/core-site.xml.template
# Jobhistory server config
COPY hdfs/hadoop-config.xml /etc/hadoop-config.xml
RUN mkdir -p /user/oozie \
&& chmod +x /etc/bootstrap.sh
RUN /etc/bootstrap.sh
WORKDIR /opt/oozie-4.2.0/
ENV OOZIE_URL http://localhost:11000/oozie

ADD spark-action/workflow.xml /user/oozie/jobs
ADD spark-action/spark-job.properties /user/oozie/jobs

ADD wait.sh /user/oozie/jobs/wait.sh
ADD setup-spark-action.sh /user/oozie/jobs/setup-spark-action.sh
RUN chmod +x /user/oozie/jobs/wait.sh && chmod +x /user/oozie/jobs/setup-spark-action.sh