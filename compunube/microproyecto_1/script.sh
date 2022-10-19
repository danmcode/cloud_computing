echo "********************"
echo "*  INICIANDO CONF  *"
echo "********************"

echo "*****************************"
echo "*  Instalación de paquetes  *"
echo "*****************************"
sudo apt-get update -y
sudo apt-get install net-tools -y

echo "************************************"
echo "*  Instalación de NodeJs  con NVM  *"
echo "************************************"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
 
echo "************************************"
echo "*  Instalación de NodeJs v16.18.0  *"
echo "************************************"
nvm install v16.18.0
nvm use v16.18.0
node -v
npm -v
echo "************************************"
echo "*      Instalación de consul       *"
echo "************************************"
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul -y
consul -v