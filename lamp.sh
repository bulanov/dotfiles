#!/bin/bash

if [ "`lsb_release -is`" == "Ubuntu" ] || [ "`lsb_release -is`" == "Debian" ]
then
     apt-get -y install mysql-server mysql-client;
     apt-get -y install apache2-mpm-itk php5 libapache2-mod-php5 php5-mcrypt php5-imagick;
     apt-get -y proftpd
     service apache2 restart;

elif [ "`lsb_release -is`" == "CentOS" ] || [ "`lsb_release -is`" == "RedHat" ]
then
      yum -y install httpd mysql-server mysql-devel php php-mysql php-fpm;
      yum -y install epel-release phpmyadmin rpm-build redhat-rpm-config;
      yum -y install mysql-community-release-el7-5.noarch.rpm proj;
      yum -y install tinyxml libzip mysql-workbench-community;
      chmod 777 -R /var/www/;
      printf "<?php\nphpinfo();\n?>" > /var/www/html/info.php;
      service mysqld restart;
      service httpd restart;
      chkconfig httpd on;
      chkconfig mysqld on;

else
    echo "Unsupported Operating System";
fi
