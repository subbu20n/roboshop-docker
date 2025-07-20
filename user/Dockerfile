# FROM node:20 
# WORKDIR /opt/server 
# COPY package.json . 
# COPY *.js .
# RUN npm install 
# ENV MONGO="true" \ 
#     REDIS_URL="redis://redis:6379" \ 
#     MONGO_URL="mongodb://mongodb:27017/users" 
# CMD ["node","server.js"]     

FROM node:20 
WORKDIR /opt/server 
ENV MONGO="true" 
ENV MONGO_URL="mongodb://mongodb:27017/users" 
ENV REDIS_URL="redis://redis:6379" 
COPY package.json .
COPY *.js .
RUN npm install 
RUN apt-get update \ 
    && apt-get install net-tools git -y \ 
    && apt-get clean
CMD ["node","server.js"] 
