#!/bin/bash
echo "Installing MySQL..."
sudo apt-get install mysql-server
echo "Configuring MySQL..."
cat mysqlconfig4confluence >> /etc/mysql/my.cnf
sudo service mysql restart
mysql < mysqldatacreation.sql
echo "Downloading Confluence installer..."
wget "https://www.atlassian.com/software/confluence/downloads/binary/atlassian-$
sudo chmod 555 atlassian-confluence-6.10.0-x64.bin
./atlassian-confluence-6.10.0-x64.bin
rm atlassian-confluence-6.10.0-x64.bin
echo "Insatlling MySQL driver..."
wget "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.$
tar -xzf mysql-connector-java-5.1.46.tar.gz
rm mysql-connector-java-5.1.46.tar.gz
mv mysql-connector-java-5.1.46/mysql-connector-java-5.1.46.jar /opt/atlassian/c$
rm -r mysql-connector-java-5.1.46
/etc/init.d/confluence restart
echo "You should now type yourserverip:8090 in your browser's address bar and s$
echo "Database type: MySQL"
echo "Connection: Simple"
echo "Hostname: localhost"
echo "Port: 3306"
echo "Database Name: confluence"
echo "Username: confluenceuser"
echo "Password: What ever you added to the installation file"
