FROM mysql:8.0 
#ENV MYSQL_ROOT_PASSWORD=RoboShop@1 
COPY entrypoint.sh /usr/share/bin/entrypoint.sh 
RUN chmod +x /usr/share/bin/entrypoint.sh 
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"] 