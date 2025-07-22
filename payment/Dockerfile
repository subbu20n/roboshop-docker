#Stage1: Builder 
FROM python3.9.23-alpine3.22 
WORKDIR /opt/server 
#Install build dependencies 
RUN apk add --no-cache python3-dev build-base linux-headers pcre-dev 
COPY requirements.txt .
RUN pip3 install --no-cache-dir --prefix=/install -r requirements.txt 

#Stage2: Final image 
FROM python3.9.23-alpine3.22 
EXPOSE 8080 
WORKDIR /opt/server 
#Runtime dependencies only 
RUN apk add --no-cache pcre 
#Create app user 
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop 
USER roboshop 
#copy installed python packages from builder 
COPY --from=builder /install  /usr/local 
#Copy application code 
COPY --chown -R roboshop:roboshop payment.ini .
COPY --chown -R roboshop:roboshop *.py .
CMD ["uwsgi","--ini","payment.ini"]

# FROM python:3.9 
# EXPOSE 8080 
# WORKDIR /opt/server 
# COPY requirements.txt . 
# COPY *.py . 
# COPY payment.ini .
# RUN pip3 install -r requirements.txt 
# CMD ["uwsgi","--ini","payment.ini"] 