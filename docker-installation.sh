#AU: Keza Mutabingwa
#Date: 10/08/2022


echo "Cleaning up the system"

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine      

sleep 3
echo "Setting Up Docker repositiory"

if [ $? -eq 0 ]

then
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
echo " Docker repository successfully created"

else
echo "Docker repository failed to be created"

fi

sleep 3

echo "Installing docker engine"

if [ $? -eq 0 ]

then
sudo yum install docker-ce docker-ce-cli containerd.io
echo "Docker engine successfully installed"

else
echo "Docker engine failed to install"

fi

sleep 4

if [ $? -eq 0 ]

then
sudo systemctl status docker
echo "Docker has been started" 

else
echo "Docker hasn't been started yet. Starting deomon now"

fi

sleep 5

if [ $? -eq 0 ]

then
sudo systemctl start docker
sudo systemctl enable docker
echo "Docker has been activated now. Checking docker status...."

else
echo "Docker failed to start"

fi

sleep 5

if [ $? -eq 0 ]

then
sudo systemctl status docker
echo "Docker status checked"

else
echo "failed"

fi

echo "Done!"
