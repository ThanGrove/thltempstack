FROM tomcat:8.0-alpine
LABEL maintainer="ndg8f@virginia.edu"

ADD helloservlet.war /usr/local/tomcat/webapps/
COPY tomcat-users.xml /usr/local/tomcat/conf/

EXPOSE 8080
CMD ["catalina.sh", "run"]

# RUN chown -R www-data:www-data /var/www/webapps/helloservlet/xml