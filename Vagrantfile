# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "debian-7-build" do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_debian-7.7_chef-provisionerless.box"
    c.vm.provision "shell", path: "scripts/build/debian_vagrant.sh"
  end

  config.vm.define "centos-7-build" do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.1_chef-provisionerless.box"
    c.vm.provision "shell", path: "scripts/build/rhel_vagrant.sh"
  end

  config.vm.define "debian-7-test" do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_debian-7.7_chef-provisionerless.box"
    c.vm.provision "shell", path: "scripts/test/debian_vagrant.sh"
  end

  config.vm.define "centos-7-test" do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.1_chef-provisionerless.box"
    c.vm.provision "shell", path: "scripts/test/rhel_vagrant.sh"
  end

end
