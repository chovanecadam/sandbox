# -*- mode: ruby -*-
# vi: set ft=ruby :

# https://docs.vagrantup.com.
Vagrant.configure("2") do |config|

  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |v|
    v.check_guest_additions = false
  end

  config.vm.synced_folder "shared", "/s", create: true, automount: true
  config.ssh.config = "./ssh_config"
 
  config.vm.define "eve" do |eve|
    eve.vm.hostname = "eve.local"
    eve.vm.box = "generic/ubuntu2004"

    eve.vm.network "private_network", type: "static", ip: "10.10.10.2",
      virtualbox__intnet: true, netmask: "255.255.255.0"

    eve.vm.network "forwarded_port", guest: 22, host: 2200,
      host_ip: "127.0.0.1", id: "ssh"

    eve.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Eve"
      v.memory = "2048"
      v.cpus = 2
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    end

  end

  config.vm.define "alice" do |alice|
    alice.vm.hostname = "alice.local"
    alice.vm.box = "generic/ubuntu2004"

    alice.vm.network "private_network", type: "static", 
      virtualbox__intnet: true, ip: "10.10.10.3", 
      netmask: "255.255.255.0"

    alice.vm.network "private_network", type: "static",
      virtualbox__intnet: true, ip: "192.168.0.2", 
      netmask: "255.255.255.0"

    alice.vm.network "forwarded_port", guest: 22, host: 2201, 
      host_ip: "127.0.0.1", id: "ssh"

    alice.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Alice"
      v.memory = "512"
      v.cpus = 1
    end
    
  end

  config.vm.define "bob" do |bob|
    bob.vm.hostname = "bob.local"
    bob.vm.box = "generic/ubuntu2004"

    bob.vm.network "private_network", type: "static",
      virtualbox__intnet: true, ip: "192.168.0.3", 
      netmask: "255.255.255.0"

    bob.vm.network "forwarded_port", guest: 22, host: 2202, 
      host_ip: "127.0.0.1", id: "ssh"

    bob.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Bob"
      v.memory = "512"
      v.cpus = 1
    end

  end

end
