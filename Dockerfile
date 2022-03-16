FROM centos:7
RUN mkdir /app
WORKDIR /app
RUN yum install git -y
RUN git clone https://github.com/Arunsai14/project-1.git
RUN yum install java -y
RUN yum install maven -y
WORKDIR project-1
RUN mvn package

# Use From directive to select Base Image
# Base Image - tomcat
FROM tomcat

# On httpd image we need code
# use COPY directive to copy from host to image
COPY --from=0 /target/WebAppCal-1.3.5.war  /webapps/
