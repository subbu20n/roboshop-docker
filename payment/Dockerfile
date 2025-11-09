# FROM python:3.9 
# EXPOSE 8080 
# WORKDIR /opt/server 
# COPY requirements.txt . 
# COPY *.py . 
# COPY payment.ini . 
# RUN pip3.9 install -r requirements.txt 
# CMD ["uwsgi","--ini","payment.ini"] 

FROM python:3.9.23-alpine3.22 AS builder 
WORKDIR /opt/server 
COPY requirements.txt .
COPY *.py . 
COPY payment.ini . 
RUN apk add --no-cache gcc musl-dev linux-headers
RUN pip3 install --no-cache-dir -r requirements.txt

FROM python:3.9.23-alpine3.22 
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop 
WORKDIR /opt/server 
USER roboshop 
COPY --from=builder /opt/server  /opt/server 
CMD ["uwsgi","--ini","payment.ini"] 