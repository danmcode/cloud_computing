echo "********************"
echo "*  INICIANDO CONF  *"
echo "********************"

echo "*****************************"
echo "*  Instalación de paquetes  *"
echo "*****************************"
sudo apt-get update -y
sudo apt-get install net-tools -y

echo "*****************************"
echo "*  Instalación HAPROXY      *"
echo "*****************************"
sudo apt-get install haproxy -y
sudo systemctl enable haproxy

#Import haproxy config file
sudo mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.old
sudo cp /home/vagrant/shared/haproxy.cfg /etc/haproxy/

#start the service
systemctl start haproxy
systemctl restart haproxy