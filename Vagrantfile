# -*- mode: ruby -*-
# vi: set ft=ruby :

# https://docs.vagrantup.com.

Vagrant.configure("2") do |config|

  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |v|
    v.check_guest_additions = false

    v.customize ["modifyvm", :id, 
      "--clipboard", "bidirectional"
    ]

    v.customize ["modifyvm", :id, 
      "--vram", "64"
    ]

  end

  config.vm.synced_folder "shared", "/s", create: true, automount: true
  config.ssh.config = "./ssh_config"
 
  config.vm.define "eve" do |eve|
    eve.vm.hostname = "eve"
    eve.vm.box = "generic/ubuntu2004"

    eve.vm.network "private_network", virtualbox__intnet: true, 
      auto_config: false

    eve.vm.network "forwarded_port", guest: 22, host: 2200,
      host_ip: "127.0.0.1", id: "ssh"

    eve.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Eve"
      v.memory = "512"
      v.cpus = 1

      v.customize ["modifyvm", :id, 
        "--graphicscontroller", "vmsvga"
      ]

    end

  end

  config.vm.define "alice" do |alice|
    alice.vm.hostname = "alice"
    alice.vm.box = "generic/ubuntu2004"

    alice.vm.network "private_network", virtualbox__intnet: true, 
      auto_config: false

    alice.vm.network "private_network", virtualbox__intnet: true, 
      auto_config: false

    alice.vm.network "forwarded_port", guest: 22, host: 2201, 
      host_ip: "127.0.0.1", id: "ssh"

    alice.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Alice"
      v.memory = "512"
      v.cpus = 1

      v.customize ["modifyvm", :id, 
        "--graphicscontroller", "vmsvga"
      ]

    end
    
  end

  config.vm.define "bob" do |bob|
    bob.vm.hostname = "bob"
    bob.vm.box = "generic/ubuntu2004"

    bob.vm.network "private_network",
      virtualbox__intnet: true, auto_config: false

    bob.vm.network "forwarded_port", guest: 22, host: 2202, 
      host_ip: "127.0.0.1", id: "ssh"

    bob.vm.provider "virtualbox" do |v|
      v.gui = false
      v.name = "Bob"
      v.memory = "512"
      v.cpus = 1

      v.customize ["modifyvm", :id, 
        "--graphicscontroller", "vmsvga"
      ]

    end

  end

  config.vm.define "win" do |win|
    win.vm.hostname = "windows"
    win.vm.box = "gusztavvargadr/windows-10"

    win.vm.network "private_network", type: "static", ip: "10.10.10.4",
      virtualbox__intnet: true, netmask: "255.255.255.0"

    win.vm.network "forwarded_port", guest: 22, host: 2203, 
      host_ip: "127.0.0.1", id: "ssh"

    win.vm.network "forwarded_port", guest: 5985, host: 55985, 
      host_ip: "127.0.0.1", id: "winrm"

    win.vm.network "forwarded_port", guest: 5986, host: 55986, 
      host_ip: "127.0.0.1", id: "winrm-ssl"

    win.vm.network "forwarded_port", guest: 3389, host: 33389, 
      host_ip: "127.0.0.1", id: "tcp33389"

    win.vm.provider "virtualbox" do |v|
      v.gui = true
      v.name = "windows-host"

      v.customize [ "storageattach", :id, 
        "--storagectl", "IDE Controller",
        "--port", "0",
        "--device", "1", 
        "--medium", "/usr/share/virtualbox/VBoxGuestAdditions.iso",
        "--type", "dvddrive"
      ]

      v.customize ["modifyvm", :id,
        "--graphicscontroller", "vboxsvga"
      ]

    end

  end

end
