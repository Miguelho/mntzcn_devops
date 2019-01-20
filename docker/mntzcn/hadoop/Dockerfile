FROM mntzcn/hadoop:latest

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh
ADD hdfsTestFiles/ /filesToUpHDFS
ADD hdfs-site.xml.template /etc/hdfs-site.xml.template
ADD core-site.xml.template /etc/core-site.xml.template
ADD yarn-site.xml.template /etc/yarn-site.xml.template
# oozie-sharelib-4.2.0.tar.gz must be download first to run this dockerfile. It can be found within the base oozie image
ADD oozie-sharelib-4.2.0.tar.gz /etc/oozie-sharelib-4.2.0.tar.gz
RUN useradd -ms /bin/bash oozie

CMD ["sh", "/etc/bootstrap.sh", "-d"]
