require 'yaml'

settings = YAML.load_file 'vagrant.yml'

Vagrant.configure('2') do |config|
  # Droplet name in DigitalOcean
  config.vm.define "my-location" do |centos7|
  end

  config.vm.provision "shell", inline: "rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/7/x86_64/e/epel-release-7-5.noarch.rpm --force"
  config.vm.provision "shell", inline: "yum -y install puppet"

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.token = settings['digital_ocean']['api_token']
    provider.image = 'centos-7-0-x64'
    provider.region = 'nyc2'
    provider.size = '512mb'
  end
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.options        = ['--verbose']
  end
end
