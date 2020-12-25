# -*- mode: ruby -*-
# vi: set ft=ruby :

# https://docs.vagrantup.com.
Vagrant.configure("2") do |config|

  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |v|
    v.check_guest_additions = false
  end

  config.vm.synced_folder "shared", "/s", create: true, automount: true
 
  config.vm.define "eve" do |eve|
    eve.vm.hostname = "eve.local"
    eve.vm.box = "generic/ubuntu2004"

    eve.vm.network "private_network", type: "static", ip: "10.10.10.2",
      virtualbox__intnet: true, netmask: "255.255.255.0"

    eve.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Eve"
      v.memory = "2048"
      v.cpus = 2
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    end

    eve.vm.provision "base-provision", type: "shell",
      path: "./provision/shell/base-provision/eve.sh",
      name: "base-provision"

    eve.vm.provision "interconnect", type: "shell", 
      path: "./provision/shell/interconnect/eve.sh", 
      name: "interconnect"

    eve.vm.provision "file", source: "./files/eve",
      destination: "~/.ssh/id_rsa"

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

    alice.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Alice"
      v.memory = "512"
      v.cpus = 1
    end
    
    alice.vm.provision "base-provision", type: "shell",
      path: "./provision/shell/base-provision/alice.sh",
      name: "base-provision"

    alice.vm.provision "interconnect", type: "shell", 
      path: "./provision/shell/interconnect/alice.sh", 
      name: "interconnect"

    alice.vm.provision "file", source: "./files/alice",
      destination: "~/.ssh/id_rsa"
  end

  config.vm.define "bob" do |bob|
    bob.vm.hostname = "bob.local"
    bob.vm.box = "generic/ubuntu2004"

    bob.vm.network "private_network", type: "static",
      virtualbox__intnet: true, ip: "192.168.0.3", 
      netmask: "255.255.255.0"

    bob.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Bob"
      v.memory = "512"
      v.cpus = 1
    end

    bob.vm.provision "base-provision", type: "shell",
      path: "./provision/shell/base-provision/bob.sh",
      name: "base-provision"
      
    bob.vm.provision "interconnect", type: "shell", 
      path: "./provision/shell/interconnect/bob.sh", 
      name: "interconnect"

    bob.vm.provision "file", source: "./files/bob",
      destination: "~/.ssh/id_rsa"
  end

  # this requires enviroment variable VAGRANT_EXPERIMENTAL
  # export VAGRANT_EXPERIMENTAL="dependency_provisioners"
  config.vm.provision "interconnect-known-hosts", type: "shell",
    path: "./provision/shell/base-provision/common.sh",
    name: "interconnect-known-hosts",
    privileged: false, after: :all

  # this replaces vagrant's key, which isn't nice
  config.vm.provision "file", source: "./files/authorized_keys",
    destination: "~/.ssh/authorized_keys"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision/ansible/playbook.yml"
  end

end
