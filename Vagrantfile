# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.host_name = "maisasas-app" 

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end

  unless RUBY_PLATFORM.include?('mingw')
    config.vm.synced_folder ".", "/vagrant", type: "nfs",
                            rsync__exclude: ".git/"
  end
  
  config.vm.provision :shell, :path => "vagrant_provision/dependencies.sh"
  config.vm.provision :shell, :path => "vagrant_provision/install_ruby.sh", :privileged => false
  config.vm.provision :shell, :path => "vagrant_provision/configure_rails.sh", :privileged => false
  config.vm.provision :shell, :path => "vagrant_provision/configure_database.sh", :privileged => false
  config.vm.provision :shell, :path => "vagrant_provision/configure_mailcatcher.sh", :privileged => false

  config.vm.network :private_network, ip: "10.11.12.13"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 1080, host: 1080
end
