# -*- mode: ruby -*-
dir = File.dirname(__FILE__)

Vagrant.configure(2) do |config|
  config.vm.box = "box-cutter/fedora22"
  config.vm.provision :shell, path: "shell/fedora22.sh", privileged: false
  config.vm.provision :shell, path: "shell/benchmarks.sh", privileged: false
  config.vm.synced_folder ".", "/vagrant", disabled: true
end