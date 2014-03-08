VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise-current-amd64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box"

  config.vm.hostname = "phabricator-p4.ohana"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provision :shell, :path => "install-phabricator.sh"
  config.vm.provision :shell, :path => "install-p4.sh"
end
