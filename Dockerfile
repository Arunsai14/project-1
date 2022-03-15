FROM amazonlinux
RUN yum install java-1.8* -y
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN yum install wget -y
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.94/bin/apache-tomcat-7.0.94.tar.gz
RUN yum install tar -y
RUN tar xvf apache-tomcat-7.0.94.tar.gz
RUN mv apache-tomcat-7.0.94/* /opt/tomcat
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
