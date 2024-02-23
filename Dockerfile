FROM docker.io/library/ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install openjdk-8-jdk wget

RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.55/bin/apache-tomcat-8.5.55.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN mv /tmp/apache-tomcat-8.5.55 /opt/tomcat

COPY target/ABCtechnologies-1.0.war /opt/tomcat/webapps/

EXPOSE 9090
CMD /opt/tomcat/bin/catalina.sh run
