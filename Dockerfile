FROM ubuntu:12.04
MAINTAINER Bongani Mthembu, "bonganim911@gmail.com"

# GENERAL
RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update && apt-get clean
RUN apt-get update

# JAVA
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean

# JENKINS
ADD http://mirrors.jenkins-ci.org/war/1.560/jenkins.war /opt/jenkins.war
RUN ln -sf /jenkins /root/.jenkins

# GIT
RUN apt-get install -q -y git

# GRADLE
ADD https://services.gradle.org/distributions/gradle-1.12-all.zip /opt/gradle-1.12-all.zip
RUN unzip /opt/gradle-1.12.-all.zip -d /opt/
ENV GRADLE_HOME /opt/gradle-1.12
ENV PATH $PATH:$GRADLE_HOME/bin

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
VOLUME ["/jenkins"]
CMD [""]
