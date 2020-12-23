# -*- mode: ruby -*-
# vi: set ft=ruby :

# https://docs.vagrantup.com.
Vagrant.configure("2") do |config|
 
  config.vm.define "eve" do |eve|
    eve.vm.hostname = "eve.local"
    eve.vm.box = "generic/alpine38"

    eve.vm.network "private_network", type: "static", ip: "10.10.10.2",
      virtualbox__intnet: true, netmask: "255.255.255.0"

    eve.vm.provider "virtualbox" do |v|
      v.gui = true
      v.name = "Eve"
      v.memory = "2048"
      v.cpus = 2
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    end

    # config.vm.provision "shell", inline: <<-SHELL
    #   apt-get update
    #   apt-get install -y apache2
    # SHELL

  end

  config.vm.define "alice" do |alice|

    alice.vm.hostname = "alice.local"
    alice.vm.box = "generic/alpine38"

    alice.vm.network "private_network", type: "static", 
      virtualbox__intnet: true, ip: "10.10.10.3", 
      netmask: "255.255.255.0"

    alice.vm.network "private_network", type: "static",
      virtualbox__intnet: true, ip: "192.168.0.2", 
      netmask: "255.255.255.0"

    alice.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Alice"
      v.memory = "256"
      v.cpus = 1
    end

  end

  config.vm.define "bob" do |bob|
    bob.vm.hostname = "bob.local"
    bob.vm.box = "generic/alpine38"

    bob.vm.network "private_network", type: "static",
      virtualbox__intnet: true, ip: "192.168.0.3", 
      netmask: "255.255.255.0"

    bob.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Bob"
      v.memory = "256"
      v.cpus = 1
    end
  end

  # config.vm.box_check_update = false

  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # config.vm.synced_folder "<host folder>", "<guest folder>"
  # config.vm.synced_folder "../data", "/vagrant_data"

end
