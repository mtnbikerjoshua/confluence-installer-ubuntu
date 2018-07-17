#!/bin/bash
echo "Installing MySQL..."
sudo apt-get install mysql-server
echo "Configuring MySQL..."
cat mysqlconfig >> /etc/mysql/my.cnf
sudo service mysql restart
read -p "Please choose a password for your confluence database: " mysqlpassword
sed -i s/InsertPasswordHere/$mysqlpassword/ mysqldatacreation.sql
mysql < mysqldatacreation.sql
echo "Downloading Confluence installer..."
wget "https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.10.0-x64.bin"
sudo chmod 555 atlassian-confluence-6.10.0-x64.bin
./atlassian-confluence-6.10.0-x64.bin
rm atlassian-confluence-6.10.0-x64.bin
echo "Insatlling MySQL driver..."
wget "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.46.tar.gz"
tar -xzf mysql-connector-java-5.1.46.tar.gz
rm mysql-connector-java-5.1.46.tar.gz
mv mysql-connector-java-5.1.46/mysql-connector-java-5.1.46.jar /opt/atlassian/confluence/confluence/WEB-INF/lib/mysql-connector-java-5.1.46.jar
rm -r mysql-connector-java-5.1.46
/etc/init.d/confluence restart
echo "You should now type yourserverip:8090 in your browser's address bar and set up confluence. When you get to the \"Set up your database\" step, choose \"My own database\" and then enter the following options:"
echo "Database type: MySQL"
echo "Setup type: Simple"
echo "Hostname: localhost"
echo "Port: 3306"
echo "Database name: confluence"
echo "Username: confluenceuser"
echo "Password: " $mysqlpassword
