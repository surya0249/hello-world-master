# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "surya.sajja" 
COPY ./webapp.war /usr/local/tomcat/webapps
