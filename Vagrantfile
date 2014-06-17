# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "docker" do |d|
    d.has_ssh = true
    d.build_dir =  "."
   d.remains_running = false
  end

  config.ssh.username = "vagrant"
  config.ssh.private_key_path = "vagrant.pkey"
end
