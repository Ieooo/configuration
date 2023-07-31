# install something in ubuntu
# please run with sudo

# init
mkdir install-temp
cd install-temp

# install make and gcc, g++
apt-get install make
apt-get install gcc
apt-get install g++

# install docker, config docker
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x get-docker.sh
sh get-docker.sh
echo '{"registry-mirrors":["https://reg-mirror.qiniu.com"]}' > /etc/daemon.json

# install go
curl https://golang.google.cn/dl/go1.20.6.linux-amd64.tar.gz
tar -zxvf go1.20.6.linux-amd64.tar.gz
mv go /opt/
go env -w GOPROXY=https://goproxy.io,direct
mkdir -p $HOME/go/bin
echo 'export PATH=/opt/go/bin:'$HOME'/go/bin:$PATH' >> $HOME/.bashrc

# install python

# install rust

# install java

# install node

# install mysql cli
wget https://downloads.mysql.com/archives/get/p/23/file/mysql-community-client-core_8.0.33-1ubuntu23.04_amd64.deb
wget https://downloads.mysql.com/archives/get/p/23/file/libmysqlclient21_8.0.33-1ubuntu23.04_amd64.deb
wget https://downloads.mysql.com/archives/get/p/23/file/mysql-common_8.0.33-1ubuntu23.04_amd64.deb
wget https://downloads.mysql.com/archives/get/p/23/file/mysql-community-client-plugins_8.0.33-1ubuntu23.04_amd64.deb
wget https://downloads.mysql.com/archives/get/p/23/file/mysql-community-client_8.0.33-1ubuntu23.04_amd64.deb
dpkg -i *.deb

# install redis cli
wget http://download.redis.io/redis-stable.tar.gz 
tar -xzvf redis-stable.tar.gz
cd redis-stable
make
mv src/redis-cli /usr/local/bin
cd ..

# install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin

# clean
cd ..
rm -rf ./install-temp
 

