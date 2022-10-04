# Practica de ambiente de trabajo.

1. Descargar e instalar [VirtualBox](https://www.virtualbox.org/ "VirtualBox")
2. Descargar e instalar [Vagrant](https://www.vagrantup.com/downloads "Vagrant")
3. Instalar los plugins para vbguest:
`vagrant plugin install vagrant-vbguest`

5. Copiar Vagrantfile:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin? "vagrant-vbguest"
    config.vbguest.no_install  = true
    config.vbguest.auto_update = false
    config.vbguest.no_remote   = true
  end

  config.vm.define :clienteUbuntu do |clienteUbuntu|
    clienteUbuntu.vm.box = "bento/ubuntu-20.04"
    clienteUbuntu.vm.network :private_network, ip: "192.168.100.2"
    clienteUbuntu.vm.hostname = "clienteUbuntu"
  end

  config.vm.define :servidorUbuntu do |servidorUbuntu|
    servidorUbuntu.vm.box = "bento/ubuntu-20.04"
    servidorUbuntu.vm.network :private_network, ip: "192.168.100.3"
    servidorUbuntu.vm.hostname = "servidorUbuntu"
  end
end

```
## Manejo de las máquinas virtuales.
1. Iniciar las máquinas virtuales.
`vagrant up`

2. Acceder a las máquinar virtuales.
`vagrant ssh servidorUbuntu`
`vagrant ssh clienteUbuntu`

3. Instalar herramientas para el manejo de la red y textos.
`sudo -i` 
`apt-get install net-tools  && apt-get install vim`

## Directorios sincronizados vagrant

> Los directorios sincronizados de vagrant permiten compatir recursos (Textos, imagenes etc.) entre la máquina anfitrión con la máquina huesped.

Para configurar los directorios sincronizados:

1. Crear o seleccionar la carpeta que se va a sincronizar, tener en cuenta su ruta.

2. En el Vagrantfile agregar la siguiente línea de código, que especifica los directorios que se van a sincronizar en la máquina anfitrion y el hueped:
`config.vm.synced_folder "dir_sinc/", "/home/vagrant/dir_sinc"`

## Instalación de Jupyter-notebooks

1. Actualizar paquetes del sistema
`sudo apt-get update`

2. Instalar el manejador de dependencias de python
`sudo apt install python3-pip`

3. Instalación de jupyter
`pip3 install jupyter`

4. Path de ejecución en las variables de entorno
`export PATH="$HOME/.local/bin:$PATH"`

5. Ejecutar el servicio de Jupyter
`jupyter notebook --ip=0.0.0.0`

## Publicar box en Vagrant Cloud
1. Re-empaquetar la máquina virtual en un nuevo Vagrant Box
`vagrant package servidorUbuntu --output mynew.box`

2. El comando anterior creara un archivo mynew.box. Con el siguiente comando agregaremos el box a nuestra instalación de Vagrant:
` vagrant box add mynewbox mynew.box`

3. Máquina Publicada: [vagrant box](https://app.vagrantup.com/dmuelas/boxes/ubuntu_basic "vagrant box")