# FROM maven AS builder 
# WORKDIR /opt/server 
# COPY pom.xml . 
# COPY src /opt/server/src 
# RUN mvn clean package 

# FROM eclipse-temurin:17-jre-alpine
# EXPOSE 8080 
# RUN addgroup -S roboshop && adduser -S roboshop -G roboshop 
# ENV CART_ENDPOINT="cart:8080" \
#     DB-HOST="mysql" 
# WORKDIR /opt/server 
# USER roboshop 
# COPY --from=builder /opt/server/target/shipping-*.jar /opt/server/shipping.jar 
# CMD ["java","-jar","shipping.jar"]
 



# FROM maven 
# WORKDIR /opt/server 
# COPY pom.xml . 
# COPY src /opt/server/src
# RUN mvn clean package 
# RUN mv /opt/server/target/shipping-1.0.jar /opt/server/shipping.jar 
# ENV CART_ENDPOINT="cart:8080" \
#     DB_HOST="mysql" 
# CMD ["java","-jar","shipping.jar"]     

FROM maven 
WORKDIR /opt/server 
COPY pom.xml . 
COPY src /opt/server/src 
RUN mvn clean package  
RUN mv /opt/server/target/shipping-1.0.jar /opt/server/shipping.jar 
ENV CART_ENDPOINT="cart:8080" \ 
    DB_HOST="mysql" 
CMD ["java","-jar","shipping.jar"]    