FROM amazonlinux

# Install Apache
RUN yum -y update
RUN yum -y install httpd httpd-tools

# Install PHP
#RUN yum -y install php

COPY index.html  /var/www/html/index.html

EXPOSE 80

# Start Apache
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
