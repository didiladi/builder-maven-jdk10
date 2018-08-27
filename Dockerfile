FROM jenkinsxio/builder-base:0.0.487

# Maven
ENV MAVEN_VERSION 3.5.3
RUN curl -L http://central.maven.org/maven2/org/apache/maven/apache-maven/$MAVEN_VERSION/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -C /opt -xzv
ENV M2_HOME /opt/apache-maven-$MAVEN_VERSION
ENV maven.home $M2_HOME
ENV M2 $M2_HOME/bin
ENV PATH $M2:$PATH

# JDK 10
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.rpm
RUN yum localinstall jdk-10.0.2_linux-x64_bin.rpm
RUN alternatives --config java

# Set JDK to be 32bit
# COPY set_java $M2
# RUN $M2/set_java && rm $M2/set_java

CMD ["mvn","-version"]
