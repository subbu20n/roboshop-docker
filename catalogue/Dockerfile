FROM node:20-alpine3.21 
RUN addgroup -S roboshop && adduser -S robohop -G roboshop 
WORKDIR /opt/server 
RUN package.json . 
RUN *.js . 
RUN npm install 
RUN chown -R roboshop:roboshop /opt/server 
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
CMD ["node","server.js"]     