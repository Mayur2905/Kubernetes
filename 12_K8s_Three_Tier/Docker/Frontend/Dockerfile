FROM centos:7
LABEL APP: "Frontend"
LABEL Author: "Mayur Gaikwad"

RUN yum install httpd -y
RUN chmod 777 /var/www/html

COPY proxy.conf /etc/httpd/conf.d/proxy.conf
COPY index.html /var/www/html/index.html
RUN chmod 644 /var/www/html/index.html

EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]