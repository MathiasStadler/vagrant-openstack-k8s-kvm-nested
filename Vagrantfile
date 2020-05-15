$script = <<-'SCRIPT'
#!/bin/bash
# switch to tmp
cd && cd /tmp
# download
echo "Download vagrant"
curl https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.rpm -O
# install
echo "Install vagrant"
sudo dnf install -y vagrant_2.2.9_x86_64.rpm
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.define :nested_host do |nested_host|
      nested_host.vm.box = "centos/8"
      nested_host.vm.provider :libvirt do |domain|
        domain.memory = 14336
        domain.cpus = 4
        domain.nested = true
        domain.volume_cache = 'none'
        domain.cpu_mode = 'host-passthrough'
        domain.machine_virtual_size = 60
      end
      # TODO config.vm.synced_folder "nested-host/", "/home/vagrent/nested-host"
      config.vm.provision "shell", inline: $script
    end
  end