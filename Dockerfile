FROM ubuntu:14.04


RUN apt-get update
RUN apt-get install curl -y
ENV MAVEN_HOME /usr/share/maven
ENV JAVA_HOME  /usr/local/tomcat/jdk1.7.0_80
RUN curl -fSL https://s3.cn-north-1.amazonaws.com.cn/complier/jdk-7u80-linux-x64.tar.gz -o jdk.tar.gz\
    && tar -xf jdk.tar.gz
RUN mkdir -p /usr/backup/
RUN cp -p /usr/bin/* /usr/backup/
RUN rm -rf /usr/bin
RUN ln -s /jdk1.7.0_80/bin /usr/bin
RUN cp -p /usr/backup/* /usr/bin/

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ENV JAVA_OPTS "$JAVA_OPTS -Duser.timezone=GMT+08"


CMD ["catalina.sh", "run"]
