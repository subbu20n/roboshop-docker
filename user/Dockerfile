# FROM node:20-alpine3.21 AS builder 
# WORKDIR /opt/server 
# COPY package.json .
# COPY *.js . 
# RUN npm install 

# FROM node:20-alpine3.21 
# EXPOSE 8080 
# RUN addgroup -S roboshop && adduser -S roboshop -G roboshop 
# ENV MONGO="true" \
#     REDIS_URL="redis://redis:6379" \
#     MONGO_URL="mongodb://mongodb:27017/users" 
# WORKDIR /opt/server 
# USER roboshop 
# COPY --from=builder /opt/server /opt/server 
# CMD ["node","server.js"] 

# FROM node:20 
# WORKDIR /opt/server
# ENV MONGO="true" 
# ENV REDIS_URL="redis://redis:6379" 
# ENV MONGO_URL="mongodb://mongodb:27017/users" 
# COPY package.json . 
# COPY *.js . 
# RUN npm install 
# RUN apt-get update \ 
#     && apt-get install  net-tools  git -y \  
#     && apt-get clean  
# CMD ["node","server.js"]         

FROM node:20 
WORKDIR /opt/server  
ENV REDIS_URL="redis://redis:6379" \
    MONGO_URL="mongodb://mongodb:27017/users" 
COPY package.json . 
COPY *.js . 
RUN npm install 
CMD ["node","server.js"]