FROM centos:7.4.1708

RUN yum install -y java-1.8.0-openjdk

ADD target/gs-rest-service-0.1.0.jar .

CMD java -jar gs-rest-service-0.1.0.jar
