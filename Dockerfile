# Use an official Tomcat runtime as the base image
FROM tomcat:9.0-jre8

# Author metadata
LABEL maintainer="sagarshastry42@gmail.com"

# Copy the WAR file into the webapps directory of Tomcat
COPY /var/lib/jenkins/workspace/webapp_project_pipeline/webapp/target/webapp.war .

# Expose port 8086 to the outside world
EXPOSE 8086

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
