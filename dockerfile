FROM centos:7.4.1708

RUN yum install -y java-1.8.0-openjdk

ADD target/hello-1.0.jar .

CMD java -jar hello-1.0.jar
