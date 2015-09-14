Vagrant.configure('2') do |config|
  # Droplet name in DigitalOcean
  config.vm.define "my-location" do |centos7|
  end

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.token = 'cb768fc97cf8d7cb4b8582803e3d06ecb8a8bb7b76f9da39f5eeb2faa848eda2'
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