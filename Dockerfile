FROM ubuntu:18.04

# Install JDK and wget
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk openjdk-11-jdk wget && \
    rm -rf /var/lib/apt/lists/*

# Download and install Apache Tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.55/bin/apache-tomcat-8.5.55.tar.gz -O /tmp/tomcat.tar.gz && \
    cd /tmp && \
    tar xvfz tomcat.tar.gz && \
    mv /tmp/apache-tomcat-8.5.55 /opt/tomcat

# Copy the WAR file to the Tomcat webapps directory
COPY /target/ABCtechnologies-1.0.war /opt/tomcat/webapps/

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
