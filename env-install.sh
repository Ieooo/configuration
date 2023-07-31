# install something in ubuntu
# please run with sudo

# init
sudo apt-get update
sudo apt-get upgrage
mkdir install-temp
cd install-temp

# install make and gcc, g++
echo "install make and gcc ..."
apt-get install make
apt-get install gcc
apt-get install g++

# install docker, config docker
echo "install docker ..."
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x get-docker.sh
sh get-docker.sh
echo '{"registry-mirrors":["https://reg-mirror.qiniu.com"]}' > /etc/daemon.json

# install go
echo "install golang ..."
curl https://golang.google.cn/dl/go1.20.6.linux-amd64.tar.gz
tar -zxvf go1.20.6.linux-amd64.tar.gz
mv go /opt/
go env -w GOPROXY=https://goproxy.io,direct
mkdir -p $HOME/go/bin
echo 'export PATH=/opt/go/bin:'$HOME'/go/bin:$PATH' >> $HOME/.bashrc

# install python
echo "install python ..."

# install rust
echo "install rust ..."

# install java
echo "install java ..."

# install node
echo "install node ..."

# install mysql cli
echo "install mysql cli ..."
wget https://downloads.mysql.com/archives/get/p/23/file/mysql-community-client-core_8.0.33-1ubuntu23.04_amd64.deb
wget https://downloads.mysql.com/archives/get/p/23/file/libmysqlclient21_8.0.33-1ubuntu23.04_amd64.deb
wget https://downloads.mysql.com/archives/get/p/23/file/mysql-common_8.0.33-1ubuntu23.04_amd64.deb
wget https://downloads.mysql.com/archives/get/p/23/file/mysql-community-client-plugins_8.0.33-1ubuntu23.04_amd64.deb
wget https://downloads.mysql.com/archives/get/p/23/file/mysql-community-client_8.0.33-1ubuntu23.04_amd64.deb
dpkg -i *.deb

# install redis cli
echo "install redis cli ..."
wget http://download.redis.io/redis-stable.tar.gz 
tar -xzvf redis-stable.tar.gz
cd redis-stable
make
mv src/redis-cli /usr/local/bin
cd ..

# install kubectl
echo "install kubectl ..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin

# uninstall some useless software in ubuntu
echo "uninstall useless software ..."
apt-get remove libreoffice-common
apt-get remove thunderbird totem rhythmbox simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-sudoku

# clean
echo "clean ..."
cd ..
rm -rf ./install-temp

echo "done ..."
echo "make other configuration by your own!"
