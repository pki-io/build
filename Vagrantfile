# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "debian-7-build" do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_debian-7.7_chef-provisionerless.box"
    c.vm.provision :shell, :inline => <<-SH
      export VERSION=#{ENV['VERSION']}
      sh /vagrant/scripts/build/debian_vagrant.sh
    SH
  end

  config.vm.define "centos-7-build" do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.1_chef-provisionerless.box"
    c.vm.provision :shell, :inline => <<-SH
      export VERSION=#{ENV['VERSION']}
      sh /vagrant/scripts/build/rhel_vagrant.sh
    SH
  end

  config.vm.define "freebsd-10-build" do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_freebsd-10.1_chef-provisionerless.box"
    c.vm.network :private_network, ip: "10.0.0.2"
    c.vm.synced_folder ".", "/vagrant", :nfs => true
    c.ssh.shell = 'sh'
    c.vm.provision :shell, :inline => <<-SH
      export VERSION=#{ENV['VERSION']}
      sh /vagrant/scripts/build/freebsd_vagrant.sh
    SH
  end

  config.vm.define "debian-7-test" do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_debian-7.7_chef-provisionerless.box"
    c.vm.provision :shell, :inline => <<-SH
      export VERSION=#{ENV['VERSION']}
      sh /vagrant/scripts/test/debian_vagrant.sh
    SH
  end

  config.vm.define "centos-7-test" do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.1_chef-provisionerless.box"
    c.vm.provision :shell, :inline => <<-SH
      export VERSION=#{ENV['VERSION']}
      sh /vagrant/scripts/test/rhel_vagrant.sh
    SH
  end

  config.vm.define "freebsd-10-test" do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_freebsd-10.1_chef-provisionerless.box"
    c.vm.network :private_network, ip: "10.0.0.2"
    c.vm.synced_folder ".", "/vagrant", :nfs => true
    c.ssh.shell = 'sh'
    c.vm.provision :shell, :inline => <<-SH
      export VERSION=#{ENV['VERSION']}
      sh /vagrant/scripts/test/freebsd_vagrant.sh
    SH
  end
end
