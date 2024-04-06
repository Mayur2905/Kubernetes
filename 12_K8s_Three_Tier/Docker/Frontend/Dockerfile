FROM httpd

LABEL app="frontend"

COPY proxy.conf /etc/httpd/conf.d/proxy.conf

COPY index.html /usr/local/apache2/htdocs/


EXPOSE 80

CMD ["httpd-foreground"]