FROM centos:7
  
LABEL APP="Backend"
LABEL Author="Mayur Gaikwad"

USER root

WORKDIR /opt/

ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz .

RUN tar -xzvf apache-tomcat-8.5.99.tar.gz

RUN yum install java -y

WORKDIR /opt/apache-tomcat-8.5.99

COPY student.war  webapps/student.war
COPY context.xml conf/context.xml

ADD mysql-connector.jar lib/mysql-connector.jar

EXPOSE 8080

CMD ["bin/catalina.sh" , "run"]
