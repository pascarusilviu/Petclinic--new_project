FROM openjdk:11
EXPOSE 8088
ADD target/petclinic.war petclinic.war
ENTRYPOINT ["java","-jar","/petclinic.war"]
