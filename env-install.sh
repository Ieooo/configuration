# install something in ubuntu
# please run with sudo

# init
sudo apt-get update -y
sudo apt-get upgrage -y
mkdir install-temp
cd install-temp

# install make and gcc, g++
echo "install make and gcc ..."
apt-get install make --y
apt-get install gcc -y
apt-get install g++ -y

# install docker, config docker
echo "install docker ..."
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x get-docker.sh
sh get-docker.sh
echo '{"registry-mirrors":["https://reg-mirror.qiniu.com"]}' > /etc/daemon.json

# install go
echo "install golang ..."
wget https://golang.google.cn/dl/go1.20.6.linux-amd64.tar.gz
tar -zxvf go1.20.6.linux-amd64.tar.gz
mv go /opt/
mkdir -p $HOME/go/bin
echo 'export PATH=/opt/go/bin:'$HOME'/go/bin:$PATH' >> $HOME/.bashrc
go env -w GOPROXY=https://goproxy.io,direct

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

# install other tools for ubuntu
echo "install tools for ubuntu ..."
apt install vim -y
apt install gnome-tweaks -y
apt install compizconfig-settings-manager -y

# uninstall some useless software in ubuntu
echo "uninstall useless software ..."
apt-get remove -y libreoffice-common
apt-get remove -y thunderbird totem rhythmbox simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-sudoku

# clean
echo "clean ..."
cd ..
rm -rf ./install-temp

echo "done ..."
