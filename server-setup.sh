#User data for an AWS instance running a Linux AMI:
yum -y install docker
systemctl unmask docker
systemctl start docker
docker run --name aline-mysql -p 3306 -e MYSQL_ROOT_PASSWORD=definitely_a_real_password -d mysql:latest

#Then connect to the server using set up and use something like MySQL Workbench to upload model.
