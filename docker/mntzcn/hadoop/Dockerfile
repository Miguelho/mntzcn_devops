FROM mntzcn/hadoop-2.7.1-java-1.8

ADD bootstrap.sh /etc/bootstrap.sh
ADD hdfsTestFiles/ /filesToUpHDFS
ADD hdfs-site.xml /etc/hdfs-site.xml
ADD core-site.xml.template /etc/core-site.xml.template
ADD hdfs-site.xml /etc/hdfs-site.xml
# oozie-sharelib-4.2.0.tar.gz must be download first to run this dockerfile. It can be found within the base oozie image
ADD oozie-sharelib-4.2.0.tar.gz /etc/oozie-sharelib-4.2.0.tar.gz
RUN useradd -ms /bin/bash oozie

CMD ["sh", "/etc/bootstrap.sh", "-d"]
