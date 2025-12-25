# # Stage 1: Build
# FROM python:3.9.23-alpine3.22 AS builder
# WORKDIR /build
# # Install build dependencies
# RUN apk add --no-cache python3-dev build-base linux-headers pcre-dev
# COPY requirements.txt .
# RUN pip3 install --no-cache-dir --prefix=/install -r requirements.txt


# # Stage 2: Final image
# FROM python:3.9.23-alpine3.22
# EXPOSE 8080
# WORKDIR /opt/server
# # Runtime dependencies only
# RUN apk add --no-cache pcre
# # Create app user
# RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
# USER roboshop
# # Copy installed Python packages from builder
# COPY --from=builder /install /usr/local
# # Copy application code
# COPY --chown=roboshop:roboshop payment.ini .
# COPY --chown=roboshop:roboshop *.py .
# CMD ["uwsgi", "--ini", "payment.ini"]


FROM python:3.9.23-alpine3.22 AS builder #[THIS IS EASY TO UNDERSTAND BASED ON ABOVE ONE ]
WORKDIR /opt/server
COPY requirements.txt .
RUN apk add --no-cache gcc musl-dev linux-headers
RUN pip3 install --no-cache-dir -r requirements.txt
COPY *.py .
COPY payment.ini .

FROM python:3.9.23-alpine3.22
EXPOSE 8080 
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /opt/server

# Copy Python packages and uwsgi binary from builder
COPY --from=builder /usr/local/lib/python3.9 /usr/local/lib/python3.9
COPY --from=builder /usr/local/bin/uwsgi /usr/local/bin/uwsgi

# Copy application code 
COPY --from=builder /opt/server /opt/server
RUN chown -R roboshop:roboshop /opt/server 
USER roboshop
CMD ["uwsgi", "--ini", "payment.ini"]   


# FROM python:3.9 
# EXPOSE 8080 
# WORKDIR /opt/server 
# COPY requirements.txt . 
# COPY *.py . 
# COPY payment.ini . 
# RUN pip3.9 install -r requirements.txt 
# CMD ["uwsgi","--ini","payment.ini"] 

