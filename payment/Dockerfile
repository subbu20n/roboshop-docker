FROM python:3.9 AS builder 
WORKDIR /opt/server 
COPY requirements.txt .
COPY payment.ini .
COPY *.PY .
RUN pip3 install -r requirements.txt 

FROM python:3.9.23-alpine3.22 
EXPOSE 8080 
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop 
WORKDIR /opt/server 
COPY --from=builder /opt/server /opt/server 
USER roboshop 
CMD ["uwsgi","-g","payment.ini"]




# FROM python:3.9 
# EXPOSE 8080 
# WORKDIR /opt/server 
# COPY requirements.txt . 
# COPY *.py . 
# COPY payment.ini .
# RUN pip3 install -r requirements.txt 
# CMD ["uwsgi","--ini","payment.ini"] 